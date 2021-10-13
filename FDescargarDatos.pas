unit FDescargarDatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin,  Buttons,
  Provider, DBClient, Mask, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, dxSkinsCore, dxSkinBlue, dxSkinsdxBarPainter, dxBar, cxClasses,
  cxButtons, SimpleSearch;

type
  TDescargaDatos = class(TForm)
    BarraEstado: TStatusBar;
    StaticText1: TStaticText;
    cEmpresa: TEdit;
    tNomEmpresa: TPanel;
    StaticText14: TStaticText;
    Bevel1: TBevel;
    cAnyo: TEdit;
    cLupaEmpresas: TSimpleSearch;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bAceptar: TdxBarLargeButton;
    bSalir: TdxBarLargeButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Aceptar(Sender: TObject);
    procedure ColorEnter(Sender: TObject);
    procedure ColorExit(Sender: TObject);
    procedure ColorExitSinCeros(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BSalirClick(Sender: TObject);
    procedure cEmpresaChange(Sender: TObject);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);

  private
    { Private declarations }
    function  ValidarSeleccion(): Boolean;
    procedure Descargar(DirDestino: String);
    function  Unload(Sql:String; ListaCampos:TStringList; NomFichero: String):Boolean;
  public
       { Public declarations }

  end;

var
   DescargaDatos: TDescargaDatos;

implementation

uses MBaseDatos, UGLobal, LArticulosCliente, LAlmacenesNormal, LAlmacenesCliente;

{$R *.dfm}

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TDescargaDatos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TDescargaDatos.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then  //Enter
     begin
          Key:=#0;
          PostMessage(Handle,WM_NEXTDLGCTL,0,0);
     end
     else if Key=#27 then  //Esc
          begin
               Key:=#0;
               Close;
          end
          else //Si el foco esta en el año
              if cAnyo.Focused then
              begin
                   //Solo permitimos numeros
                   if not (((Key>='0') and (Key<='9')) or (Key=#8)) then
                      Key:=#0;
              end;
end;

//----------------------- BOTON ACEPTAR ----------------------------------------
procedure TDescargaDatos.Aceptar(Sender: TObject);
Var
   DirDestino: string;
   Fecha, Hora: String;
begin
     try
        PostMessage(Handle,WM_NEXTDLGCTL,0,0);
        Application.ProcessMessages;
        if ValidarSeleccion() then
        begin
             Fecha:=StringReplace(DateToStr(Date()), '/', '_',[rfReplaceAll]);
             Hora:=StringReplace(TimeToStr(Now()), ':', '_',[rfReplaceAll]);
             DirDestino:=ExtractFilePath(Application.ExeName) + 'Descargas\' + cAnyo.Text + '-' + Fecha + '-' + Hora;
             if DirectoryExists(DirDestino) then
             begin
                  MessageDlg(Chr(13) +
                             'La ruta de destino ya existe.' +
                              Chr(13) +
                             'El proceso no puede continuar.', mtError,[mbOk],0);
             end
             else
             begin
                  if CreateDir(DirDestino) then
                  begin
                       if DirectoryExists(DirDestino) then
                       begin
                           Descargar(DirDestino);
                       end
                       else
                           MessageDlg(Chr(13) +
                                      'Ha sido imposible crear la ruta de destino.' +
                                       Chr(13) +
                                      'El proceso no puede continuar.', mtError,[mbOk],0);
                  end
                  else
                      MessageDlg(Chr(13) +
                                 'Ha sido imposible crear la ruta de destino.' +
                                  Chr(13) +
                                 'El proceso no puede continuar.', mtError,[mbOk],0);
             end;
        end;
     except
           on E:Exception do
                CapturaErrores(E);
     end;
end;

//----------------------- VALIDA LA SELECCION ----------------------------------
function TDescargaDatos.ValidarSeleccion(): Boolean;
begin
     Result:=True;
     if cEmpresa.Text='' then
     begin
          MessageDlg (Chr(13) + 'Falta la empresa', mtError,[mbOk],0);
          cEmpresa.SetFocus;
          Result:=False;
     end
     else if tNomEmpresa.Caption='' then
     begin
          MessageDlg (Chr(13) + 'La empresa no existe', mtError,[mbOk],0);
          cEmpresa.SetFocus;
          Result:=False;
     end
     else if not EsNumerico(cAnyo.Text) then
     begin
          MessageDlg (Chr(13) + 'El año es incorrecto', mtError,[mbOk],0);
          cAnyo.SetFocus;
          Result:=False;
     end;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TDescargaDatos.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen
//     else if Sender is  TDateEdit then        //Si el componente es un TDateEdit
//             TDateEdit(Sender).Color:=clMoneygreen
          else if Sender is TComboBox then           //Si el componente es un TComboBox
                  TComboBox(Sender).Color:=clMoneygreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TDescargaDatos.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow;
//          else if Sender is  TDateEdit then        //Si el componente es un TDateEdit
//                  TDateEdit(Sender).Color:=clWindow;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TDescargaDatos.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clWindow
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow
//          else if Sender is  TDateEdit then        //Si el componente es un TDateEdit
//                  TDateEdit(Sender).Color:=clWindow;
end;

//------------------------- CREACION DEL FORMULARIO ----------------------------
procedure TDescargaDatos.FormCreate(Sender: TObject);
begin
     Top:=1;
     Left:=0;
end;

//------------------------- CIERRE DEL FORMULARIO ------------------------------
procedure TDescargaDatos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

//------------------------- BOTON SALIR ----------------------------------------
procedure TDescargaDatos.BSalirClick(Sender: TObject);
begin
     Close;
end;

//------------------------ AL CAMBIAR LA EMPRESA -------------------------------
procedure TDescargaDatos.cEmpresaChange(Sender: TObject);
begin
     tNomEmpresa.Caption:= NomEmpresa(RellenarCeros(cEmpresa.Text,cEmpresa.MaxLength,'I'));
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TDescargaDatos.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TDescargaDatos.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresa.Text:=CodEmpresa;
     cEmpresa.SetFocus;
end;

//-------------------------- REALIZA EL PROCESO DE DESCARGA --------------------
procedure TDescargaDatos.Descargar(DirDestino: String);
Var
   QAux, QAux2: TQuery;
   ListaCampos: TStringList;
   SqlText, FechaHasta: String;
   HayDescarga: Boolean;
begin
     try
        FechaHasta:=cAnyo.Text + '/12/31';

        if not DMBaseDatos.BDFrigo.InTransaction then
           DMBaseDatos.BDFrigo.StartTransaction;

        QAux:=TQuery.Create(Self);
        QAux2:=TQuery.Create(Self);
        try
           QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
           QAux2.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;

           ListaCampos:=TStringList.Create;
           try
              //------ Borrado de tablas temporales ----------------------------
              QAux.SQL.Clear;
              QAux.SQL.Add('DELETE FROM TEMP_ENTRADAS');
              QAux.ExecSQL;

              QAux.SQL.Clear;
              QAux.SQL.Add('DELETE FROM TEMP_LOTES_GUARDAR');
              QAux.ExecSQL;

              //---------- Nos guardamos todas la entradas de la empresa ------
              QAux.SQL.Add(' INSERT INTO TEMP_ENTRADAS(EMPRESA_TE, CLIENTE_TE, LOTE_TE, FECHA_TE) ' +
                           ' SELECT EMPRESA_CE, CLIENTE_CE, LOTE_lE, FECHA_ALBARAN_CE ' +
                           ' FROM CABECERA_ENTRADAS, LINEA_ENTRADAS ' +
                           ' WHERE EMPRESA_CE=EMPRESA_LE ' +
                           ' AND ALBARAN_CE=ALBARAN_LE ' +
                           ' AND EMPRESA_CE=' + QuotedStr(cEmpresa.Text));
              QAux.ExecSQL;

              //Guardamos los almacenes que no tienen stock y que no existe su entrada correspondiente
              //o su fecha es anterior al fin del año seleccionado
              QAux.SQL.Clear;
              QAux.SQL.Add(' INSERT INTO TEMP_LOTES_GUARDAR ' +
                           ' SELECT * FROM ALMACENES ' +
                           ' WHERE EMPRESA_AL=' + QuotedStr(cEmpresa.Text) +
                           ' AND (BULTOS_ENTRADOS_AL - BULTOS_SALIDOS_AL)=0 ' +
                           ' AND ESTUCHES_SUELTOS_AL=0 ' +
                           ' AND (UNIDADES_ENTRADAS_AL - (UNIDADES_SALIDAS_AL + UNIDADES_MERMAS_AL  + UNIDADES_DESTRUIDAS_AL))=0 ' +
                           ' AND (NOT EXISTS( SELECT * FROM TEMP_ENTRADAS ' +
                                            ' WHERE EMPRESA_TE=EMPRESA_AL ' +
                                            ' AND CLIENTE_TE=CLIENTE_AL ' +
                                            ' AND LOTE_TE=LOTE_AL ' +
                                           ' ) ' +
                           ' OR ' +
                           ' EXISTS( SELECT * FROM TEMP_ENTRADAS ' +
                                   ' WHERE EMPRESA_TE=EMPRESA_AL ' +
                                   ' AND CLIENTE_TE=CLIENTE_AL ' +
                                   ' AND LOTE_TE=LOTE_AL ' +
                                   ' AND FECHA_TE<=' + QuotedStr(FechaHasta) + '))');
               QAux.ExecSQL;

               //--------- Descargamos la tabla temp_lotes_guardar --------------
               ListaCampos.Clear;
               ListaCampos.Add('empresa_al');
               ListaCampos.Add('cliente_al');
               ListaCampos.Add('familia_al');
               ListaCampos.Add('articulo_al');
               ListaCampos.Add('lote_al');
               ListaCampos.Add('bultos_entrados_al');
               ListaCampos.Add('bultos_salidos_al');
               ListaCampos.Add('unidades_entradas_al');
               ListaCampos.Add('unidades_salidas_al');
               ListaCampos.Add('unidades_destruidas_al');
               ListaCampos.Add('unidades_mermas_al');
               ListaCampos.Add('status_retenido_al');
               ListaCampos.Add('numero_camara_al');
               ListaCampos.Add('zona_al');
               ListaCampos.Add('estuches_bulto_al');
               ListaCampos.Add('estuches_sueltos_al');
               ListaCampos.Add('estuches_totales_al');
               ListaCampos.Add('tipo_lote_al');
               ListaCampos.Add('fecha_entrada_al');
               ListaCampos.Add('fecha_caducidad_al');
               ListaCampos.Add('unid_sal_mismo_dia_al');
               ListaCampos.Add('palets_entrados_al');
               ListaCampos.Add('palets_salidos_al');
               ListaCampos.Add('fecha_modif_al');

               SqlText:='SELECT * FROM TEMP_LOTES_GUARDAR ORDER BY EMPRESA_al, CLIENTE_al, LOTE_al';
               HayDescarga:=Unload(SqlText, ListaCampos, DirDestino + '\Almacen.txt');

               //--------- Descargamos Cabeceras de Albaranes de Entrada -------------------
               ListaCampos.Clear;
               ListaCampos.Add('empresa_ce');
               ListaCampos.Add('albaran_ce');
               ListaCampos.Add('cliente_ce');
               ListaCampos.Add('fecha_albaran_ce');
               ListaCampos.Add('importe_entrada_ce');
               ListaCampos.Add('horas_entrada_ce');
               ListaCampos.Add('numero_factura_ce');
               ListaCampos.Add('fecha_factura_ce');
               ListaCampos.Add('temperatura_ce');
               ListaCampos.Add('concepto_ce');
               ListaCampos.Add('tipo_entrada_ce');
               ListaCampos.Add('transportista_ce');
               ListaCampos.Add('matricula_ce');
               ListaCampos.Add('procedencia_ce');
               ListaCampos.Add('observaciones_ce');
               ListaCampos.Add('concepto2_ce');
               ListaCampos.Add('hora_ce');
               SqlText:=' SELECT * FROM CABECERA_ENTRADAS ' +
                        ' WHERE EMPRESA_CE=' + QuotedStr(cEmpresa.Text) +
                        ' AND FECHA_ALBARAN_CE<=' + QuotedStr(FechaHasta) +
                        ' ORDER BY EMPRESA_CE, ALBARAN_CE';
               HayDescarga:=Unload(SqlText, ListaCampos, DirDestino + '\Ent_Cab.txt');

               //--------- Descargamos Lineas de Albaranes de Entrada ----------------------
               ListaCampos.Clear;
               ListaCampos.Add('empresa_le');
               ListaCampos.Add('albaran_le');
               ListaCampos.Add('familia_le');
               ListaCampos.Add('articulo_le');
               ListaCampos.Add('lote_le');
               ListaCampos.Add('bultos_le');
               ListaCampos.Add('unidades_le');
               ListaCampos.Add('camara_le');
               ListaCampos.Add('zona_le');
               ListaCampos.Add('manejo_le');
               ListaCampos.Add('palets_le');
               ListaCampos.Add('estuches_bulto_le');
               ListaCampos.Add('estuches_sueltos_le');
               ListaCampos.Add('caducidad_le');
               SqlText:=' SELECT * FROM LINEA_ENTRADAS ' +
                        ' WHERE EMPRESA_LE=' + QuotedStr(cEmpresa.Text) +
                        ' AND ALBARAN_LE IN (SELECT ALBARAN_CE FROM CABECERA_ENTRADAS ' +
                                           ' WHERE EMPRESA_CE=' + QuotedStr(cEmpresa.Text) +
                                           ' AND FECHA_ALBARAN_CE<=' + QuotedStr(FechaHasta) + ')' +
                        ' ORDER BY EMPRESA_LE, ALBARAN_LE, LOTE_LE';
               HayDescarga:=Unload(SqlText, ListaCampos, DirDestino + '\Ent_Lin.txt');

               //--------- Descargamos Cabeceras de Albaranes de Salida --------------------
               ListaCampos.Clear;
               ListaCampos.Add('empresa_cs');
               ListaCampos.Add('albaran_cs');
               ListaCampos.Add('cliente_cs');
               ListaCampos.Add('tipo_salida_cs');
               ListaCampos.Add('fecha_albaran_cs');
               ListaCampos.Add('importe_salida_cs');
               ListaCampos.Add('horas_salida_cs');
               ListaCampos.Add('numero_factura_cs');
               ListaCampos.Add('fecha_factura_cs');
               ListaCampos.Add('orden_numero_cs');
               ListaCampos.Add('concepto_cs');
               ListaCampos.Add('matricula_cs');
               ListaCampos.Add('observaciones_cs');
               ListaCampos.Add('retira_cs');
               ListaCampos.Add('nif_retira_cs');
               ListaCampos.Add('hora_cs');
               SqlText:=' SELECT * FROM CABECERA_SALIDAS ' +
                        ' WHERE EMPRESA_CS=' + QuotedStr(cEmpresa.Text) +
                        ' AND FECHA_ALBARAN_CS<=' + QuotedStr(FechaHasta) +
                        ' ORDER BY EMPRESA_CS, ALBARAN_CS';
               HayDescarga:=Unload(SqlText, ListaCampos, DirDestino + '\Sal_Cab.txt');

               //--------- Descargamos Lineas de Albaranes de Salida -----------------------
               ListaCampos.Clear;
               ListaCampos.Add('empresa_ls');
               ListaCampos.Add('albaran_ls');
               ListaCampos.Add('familia_ls');
               ListaCampos.Add('articulo_ls');
               ListaCampos.Add('lote_ls');
               ListaCampos.Add('bultos_ls');
               ListaCampos.Add('unidades_ls');
               ListaCampos.Add('estuches_sueltos_ls');
               ListaCampos.Add('tipo_lote_ls');
               ListaCampos.Add('palets_ls');
               SqlText:=' SELECT * FROM LINEA_SALIDAS ' +
                        ' WHERE EMPRESA_LS=' + QuotedStr(cEmpresa.Text) +
                        ' AND ALBARAN_LS IN( SELECT ALBARAN_CS FROM CABECERA_SALIDAS ' +
                                           ' WHERE EMPRESA_CS=' + QuotedStr(cEmpresa.Text) +
                                           ' AND FECHA_ALBARAN_CS<=' + QuotedStr(FechaHasta) + ')' +
                        ' ORDER BY EMPRESA_LS, ALBARAN_LS, LOTE_LS';
               HayDescarga:=Unload(SqlText, ListaCampos, DirDestino + '\Sal_Lin.txt');

               //---------- Descarga de Cobros ---------------------------------------------
               ListaCampos.Clear;
               ListaCampos.Add('empresa_co');
               ListaCampos.Add('cliente_co');
               ListaCampos.Add('factura_co');
               ListaCampos.Add('fecha_factura_co');
               ListaCampos.Add('fecha_pago_co');
               ListaCampos.Add('tipo_cobro_co');
               ListaCampos.Add('importe_co');
               ListaCampos.Add('serial_co');
               SqlText:=' SELECT * FROM COBROS ' +
                        ' WHERE EMPRESA_CO=' + QuotedStr(cEmpresa.Text) +
                        ' AND FECHA_FACTURA_CO<=' + QuotedStr(FechaHasta) +
                        ' ORDER BY EMPRESA_CO, CLIENTE_CO, FACTURA_CO';
               HayDescarga:=Unload(SqlText, ListaCampos, DirDestino + '\Cobros.txt');

               //--------- Descargamos Lineas de Facturas ----------------------
               ListaCampos.Clear;
               ListaCampos.Add('empresa_lf');
               ListaCampos.Add('cliente_lf');
               ListaCampos.Add('numero_factura_lf');
               ListaCampos.Add('fecha_factura_lf');
               ListaCampos.Add('numero_linea_lf');
               ListaCampos.Add('codigo_lf');
               ListaCampos.Add('descripcion_lf');
               ListaCampos.Add('cantidad_lf');
               ListaCampos.Add('unidad_lf');
               ListaCampos.Add('precio_lf');
               ListaCampos.Add('tipo_lf');
               ListaCampos.Add('importe_lf');
               SqlText:=' SELECT * FROM LINEA_FACTURAS ' +
                        ' WHERE EMPRESA_LF=' + QuotedStr(cEmpresa.Text) +
                        ' AND FECHA_FACTURA_LF <=' + QuotedStr(FechaHasta) +
                        ' AND NUMERO_FACTURA_LF IN (SELECT NUMERO_FACTURA_CF FROM CABECERA_FACTURAS ' +
                                                  ' WHERE EMPRESA_CF=' + QuotedStr(cEmpresa.Text) +
                                                  ' AND FECHA_FACTURA_CF<=' + QuotedStr(FechaHasta) + ')' +
                        ' ORDER BY EMPRESA_LF, FECHA_FACTURA_LF, NUMERO_FACTURA_LF';
               HayDescarga:=Unload(SqlText, ListaCampos, DirDestino + '\FacturasL.txt');

               //---------- Descarga de Facturas -------------------------------------------
               ListaCampos.Clear;
               ListaCampos.Add('empresa_cf');
               ListaCampos.Add('cliente_cf');
               ListaCampos.Add('numero_factura_cf');
               ListaCampos.Add('fecha_factura_cf');
               ListaCampos.Add('fecha_vencimiento_cf');
               ListaCampos.Add('fecha_desde_cf');
               ListaCampos.Add('fecha_hasta_cf');
               ListaCampos.Add('importe_bruto_cf');
               ListaCampos.Add('porcentaje_iva_cf');
               ListaCampos.Add('importe_iva_cf');
               ListaCampos.Add('importe_neto_cf');
               ListaCampos.Add('tipo_cf');
               ListaCampos.Add('num_contabilizacion_cf');
               ListaCampos.Add('ultimo_stock_cf');
               ListaCampos.Add('fecha_contabilizacion_cf');
               SqlText:=' SELECT * FROM CABECERA_FACTURAS ' +
                        ' WHERE EMPRESA_CF=' + QuotedStr(cEmpresa.Text) +
                        ' AND FECHA_FACTURA_CF<=' + QuotedStr(FechaHasta) +
                        ' ORDER BY EMPRESA_CF, FECHA_FACTURA_CF, NUMERO_FACTURA_CF';
               HayDescarga:=Unload(SqlText, ListaCampos, DirDestino + '\FacturasC.txt');
           finally
                  FreeAndNil(ListaCampos);
           end;
           //Si existen datos descargados
           if HayDescarga then
           begin
               //---------------------- Borrado de Almacenes ------------------------
               QAux.Close;
               QAux.SQL.Clear;
               QAux.SQL.Add('SELECT * FROM TEMP_LOTES_GUARDAR');
               QAux.Open;
               if not QAux.IsEmpty then
               begin
                    QAux2.Close;
                    QAux2.SQL.Clear;
                    QAux2.SQL.Add(' DELETE FROM ALMACENES ' +
                                  ' WHERE EMPRESA_AL=' + QuotedStr(cEmpresa.Text) +
                                  ' AND CLIENTE_AL=:Cliente ' +
                                  ' AND LOTE_AL=:Lote');
                    QAux2.Prepare;

                    while not QAux.Eof do
                    begin
                         QAux2.Close;
                         QAux2.ParamByName('Cliente').AsString:=QAux.FieldByName('Cliente_al').AsString;
                         QAux2.ParamByName('Lote').AsString:=QAux.FieldByName('Lote_al').AsString;
                         QAux2.ExecSQL;
                         QAux.Next;
                    end;
                    QAux.Close;
               end;
               //----------------------- Borrado de Lineas de Albaranes de Entrada -----------
               QAux.Close;
               QAux.SQL.Clear;
               QAux.SQL.Add(' DELETE FROM LINEA_ENTRADAS ' +
                            ' WHERE EMPRESA_LE=' + QuotedStr(cEmpresa.Text) +
                            ' AND ALBARAN_LE IN (SELECT ALBARAN_CE FROM CABECERA_ENTRADAS ' +
                                               ' WHERE EMPRESA_CE=' + QuotedStr(cEmpresa.Text) +
                                               ' AND FECHA_ALBARAN_CE<=' + QuotedStr(FechaHasta) + ')');
                QAux.ExecSQL;

                //----------------------- Borrado de Cabeceras de Albaranes de Entrada -----------
                QAux.Close;
                QAux.SQL.Clear;
                QAux.SQL.Add(' DELETE FROM CABECERA_ENTRADAS ' +
                             ' WHERE EMPRESA_CE=' + QuotedStr(cEmpresa.Text) +
                             ' AND FECHA_ALBARAN_CE<=' + QuotedStr(FechaHasta));
                QAux.ExecSQL;

                //----------------------- Borrado de Lineas de Albaranes de Salidas --------------
                QAux.Close;
                QAux.SQL.Clear;
                QAux.SQL.Add(' DELETE FROM LINEA_SALIDAS ' +
                             ' WHERE EMPRESA_LS=' + QuotedStr(cEmpresa.Text) +
                             ' AND ALBARAN_LS IN( SELECT ALBARAN_CS FROM CABECERA_SALIDAS ' +
                                                ' WHERE EMPRESA_CS=' + QuotedStr(cEmpresa.Text) +
                                                ' AND FECHA_ALBARAN_CS<=' + QuotedStr(FechaHasta) + ')');
                QAux.ExecSQL;

                //----------------------- Borrado de Cabeceras de Albaranes de Salida -----------
                QAux.Close;
                QAux.SQL.Clear;
                QAux.SQL.Add(' DELETE FROM CABECERA_SALIDAS ' +
                             ' WHERE EMPRESA_CS=' + QuotedStr(cEmpresa.Text) +
                             ' AND FECHA_ALBARAN_CS<=' + QuotedStr(FechaHasta));
                QAux.ExecSQL;

                //----------------------- Borrado de Cobros --------------------------------------
                QAux.Close;
                QAux.SQL.Clear;
                QAux.SQL.Add(' DELETE FROM COBROS ' +
                             ' WHERE EMPRESA_CO=' + QuotedStr(cEmpresa.Text) +
                             ' AND FECHA_FACTURA_CO<=' + QuotedStr(FechaHasta));
                QAux.ExecSQL;

                //----------------------- Borrado de Lineas de Facturas --------------------------
                QAux.Close;
                QAux.SQL.Clear;
                QAux.SQL.Add(' DELETE FROM LINEA_FACTURAS ' +
                             ' WHERE EMPRESA_LF=' + QuotedStr(cEmpresa.Text) +
                             ' AND FECHA_FACTURA_LF <=' + QuotedStr(FechaHasta) +
                             ' AND NUMERO_FACTURA_LF IN (SELECT NUMERO_FACTURA_CF FROM CABECERA_FACTURAS ' +
                                                       ' WHERE EMPRESA_CF=' + QuotedStr(cEmpresa.Text) +
                                                       ' AND FECHA_FACTURA_CF<=' + QuotedStr(FechaHasta) + ')');
                QAux.ExecSQL;

                //----------------------- Borrado de Facturas ------------------------
                QAux.Close;
                QAux.SQL.Clear;
                QAux.SQL.Add(' DELETE FROM CABECERA_FACTURAS ' +
                             ' WHERE EMPRESA_CF=' + QuotedStr(cEmpresa.Text) +
                             ' AND FECHA_FACTURA_CF<=' + QuotedStr(FechaHasta));
                QAux.ExecSQL;
                MessageDlg(Chr(13) +
                          'Descarga finalizada correctamente.' +
                           Chr(13) +
                          'Destino de los datos: ' + DirDestino, mtInformation,[mbOk],0);
           end
           else
           begin
                BorrarDirectorio(DirDestino);
                MessageDlg(Chr(13) +
                          'Descarga finalizada.' +
                          Chr(13) +
                          'No existen datos.', mtError,[mbOk],0);
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
               QAux2.Close;
               FreeAndNil(QAux2);
        end;
        if DMBaseDatos.BDFrigo.InTransaction then
           DMBaseDatos.BDFrigo.Commit;
     except
           on E:Exception do
                begin
                     CapturaErrores(E);
                     BorrarDirectorio(DirDestino);
                     if DMBaseDatos.BDFrigo.InTransaction then
                        DMBaseDatos.BDFrigo.Rollback;
                end;
     end;
end;

//-------------------- HACE UN UNLOAD DE UNA QUERY EN UN FICHERO ----------------
function TDescargaDatos.Unload(Sql: String; ListaCampos:TStringList; NomFichero: String):Boolean;
Var
   QAux: TQuery;
   Fichero: TextFile;
   i, NCampos: Integer;
   Cadena: String;
begin
     Result:=False;
     QAux:=TQuery.Create(Self);
     try
        NCampos:=ListaCampos.Count;

        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux.SQL.Add(Sql);
        QAux.Open;
        if not QAux.Eof then
        begin
             //Abrimos el Fichero en el que guardamos el AÑO_MES
             AssignFile(Fichero, NomFichero);
             Rewrite(Fichero);
             try
                while not QAux.Eof do
                begin
                     i:=0;
                     Cadena:='';
                     while i<ListaCampos.Count do
                     begin
                          if i=(NCampos-1) then
                             Cadena:=Cadena + QAux.FieldByName(ListaCampos.Strings[i]).AsString
                          else
                              Cadena:=Cadena + QAux.FieldByName(ListaCampos.Strings[i]).AsString + '|';
                          Inc(i);
                     end;
                     Writeln(Fichero, Cadena);
                     QAux.Next;
                end;
              finally
                     CloseFile(Fichero);
                     Reset(Fichero);
                     if FileSize(Fichero)<>0 then
                        Result:=True;
                     CloseFile(Fichero);
              end;
        end;
     finally
            QAux.Close;
            FreeAndNil(QAux);
     end;
end;

end.
