unit BAlmacenes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, StdCtrls, ComCtrls,
  ToolWin,  Buttons,
  Provider, DBClient, DBCtrls, Mask, dxSkinsCore, dxSkinBlue,
  dxSkinsdxBarPainter, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxButtons, SimpleSearch, dxBar, cxClasses;

type
  TBusquedaAlmacenes = class(TForm)
    Query1: TQuery;
    DS: TDataSource;
    Timer1: TTimer;
    PanelDatos: TPanel;
    GridLineas: TDBGrid;
    QContar: TQuery;
    BarraEstado: TStatusBar;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1empresa_al: TStringField;
    ClientDataSet1cliente_al: TStringField;
    ClientDataSet1familia_al: TStringField;
    ClientDataSet1articulo_al: TStringField;
    ClientDataSet1lote_al: TStringField;
    ClientDataSet1tipo_lote_al: TStringField;
    ClientDataSet1fecha_entrada_al: TStringField;
    ClientDataSet1Fecha: TStringField;
    ClientDataSet1bultos_entrados_al: TIntegerField;
    ClientDataSet1bultos_salidos_al: TIntegerField;
    ClientDataSet1unidades_entradas_al: TFloatField;
    ClientDataSet1unidades_salidas_al: TFloatField;
    ClientDataSet1unidades_destruidas_al: TFloatField;
    ClientDataSet1unidades_mermas_al: TFloatField;
    ClientDataSet1status_retenido_al: TStringField;
    ClientDataSet1numero_camara_al: TSmallintField;
    ClientDataSet1zona_al: TStringField;
    ClientDataSet1estuches_bulto_al: TIntegerField;
    ClientDataSet1estuches_sueltos_al: TIntegerField;
    ClientDataSet1estuches_totales_al: TIntegerField;
    ClientDataSet1fecha_caducidad_al: TStringField;
    ClientDataSet1unid_sal_mismo_dia_al: TFloatField;
    ClientDataSet1palets_entrados_al: TIntegerField;
    ClientDataSet1palets_salidos_al: TIntegerField;
    ClientDataSet1fecha_modif_al: TStringField;
    ClientDataSet1empresa_c: TStringField;
    ClientDataSet1codigo_c: TStringField;
    ClientDataSet1nombre_juridico_c: TStringField;
    ClientDataSet1nombre_comercial_c: TStringField;
    ClientDataSet1domicilio_c: TStringField;
    ClientDataSet1cp_c: TStringField;
    ClientDataSet1poblacion_c: TStringField;
    ClientDataSet1domicilio_correo_c: TStringField;
    ClientDataSet1cp_correo_c: TStringField;
    ClientDataSet1poblacion_correo_c: TStringField;
    ClientDataSet1telefono1_c: TStringField;
    ClientDataSet1telefono2_c: TStringField;
    ClientDataSet1fax_c: TStringField;
    ClientDataSet1cif_dni_c: TStringField;
    ClientDataSet1origen_c: TStringField;
    ClientDataSet1imp_alquiler_oficina_c: TFloatField;
    ClientDataSet1imp_thermoking_c: TFloatField;
    ClientDataSet1precio_kw_thermo_c: TFloatField;
    ClientDataSet1imp_cargo_fijo_c: TFloatField;
    ClientDataSet1precio_horas_ent_sal_c: TFloatField;
    ClientDataSet1imp_minimo_facturacion_c: TFloatField;
    ClientDataSet1periodo_factura_c: TStringField;
    ClientDataSet1tarifa_c: TStringField;
    ClientDataSet1m3_facturacion_c: TIntegerField;
    ClientDataSet1m3_refrigeracion_c: TIntegerField;
    ClientDataSet1dias_pago_c: TSmallintField;
    ClientDataSet1forma_pago_c: TStringField;
    ClientDataSet1cuenta_cliente_c: TStringField;
    ClientDataSet1nombre_banco_c: TStringField;
    ClientDataSet1domicilio_banco_c: TStringField;
    ClientDataSet1cp_banco_c: TStringField;
    ClientDataSet1poblacion_banco_c: TStringField;
    ClientDataSet1ultimo_stock_c: TFloatField;
    ClientDataSet1numerador_lotes_c: TIntegerField;
    ClientDataSet1nom_autorizado1_c: TStringField;
    ClientDataSet1cif_autorizado1_c: TStringField;
    ClientDataSet1fecha_autorizado1_c: TStringField;
    ClientDataSet1nom_autorizado2_c: TStringField;
    ClientDataSet1cif_autorizado2_c: TStringField;
    ClientDataSet1fecha_autorizado2_c: TStringField;
    ClientDataSet1comentario_c: TStringField;
    ClientDataSet1valor_stock_c: TFloatField;
    ClientDataSet1imp_pendiente_pago_c: TFloatField;
    ClientDataSet1mercancia_retenida_c: TStringField;
    ClientDataSet1tlfmovil_c: TStringField;
    ClientDataSet1email_c: TStringField;
    ClientDataSet1web_c: TStringField;
    ClientDataSet1precio_hor_clima_c: TFloatField;
    ClientDataSet1cuenta_contable_c: TStringField;
    ClientDataSet1codigo_pago_c: TStringField;
    ClientDataSet1empresa_a: TStringField;
    ClientDataSet1familia_a: TStringField;
    ClientDataSet1codigo_a: TStringField;
    ClientDataSet1denominacion_a: TStringField;
    ClientDataSet1unidad_medida_a: TStringField;
    ClientDataSet1valor_por_kg_a: TFloatField;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    bNuevaBusqueda: TdxBarButton;
    bPrimero: TdxBarButton;
    bAnterior: TdxBarButton;
    bSiguiente: TdxBarButton;
    bUltimo: TdxBarButton;
    bAceptar: TdxBarButton;
    bCancelar: TdxBarButton;
    PanelClaves: TPanel;
    nbLabel5: TLabel;
    StaticText1: TStaticText;
    tNomEmpresa: TPanel;
    cEmpresaBus: TEdit;
    cClienteBus: TEdit;
    tNomcliente: TPanel;
    StaticText2: TStaticText;
    cLoteBus: TEdit;
    StaticText3: TStaticText;
    cTipoLoteBus: TComboBox;
    Panel1: TPanel;
    Articulo: TLabel;
    StaticText13: TStaticText;
    cFamiliaBus: TEdit;
    tNomFamilia: TPanel;
    tNomArticulo: TPanel;
    cArticuloBus: TEdit;
    SimpleSearch1: TSimpleSearch;
    cLupaArticulos: TSimpleSearch;
    GBoxBultos: TGroupBox;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    cBultosEnt: TEdit;
    cBultosSal: TEdit;
    GBoxEstuches: TGroupBox;
    StaticText18: TStaticText;
    StaticText21: TStaticText;
    StaticText20: TStaticText;
    cEstuchesBulto: TEdit;
    cEstuchesSueltos: TEdit;
    cEstuchesTotales: TEdit;
    GBoxPalets: TGroupBox;
    StaticText16: TStaticText;
    StaticText17: TStaticText;
    cPaletsEnt: TEdit;
    cPaletsSal: TEdit;
    GBoxUnidades: TGroupBox;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    cUnidadeEnt: TEdit;
    cUnidadesSal: TEdit;
    cUnidadesSalMismoDia: TEdit;
    cDestruidas: TEdit;
    cMermas: TEdit;
    Panel2: TPanel;
    StaticText23: TStaticText;
    StaticText24: TStaticText;
    cCamara: TEdit;
    cZona: TEdit;
    cRetenido: TCheckBox;
    cLupaEmpresas: TSimpleSearch;
    cLupaClilentes: TSimpleSearch;
    procedure NuevaBusqueda(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Aceptar(Sender: TObject);
    procedure Cancelar(Sender: TObject);
    procedure GridLineasDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure GridLineasTitleClick(Column: TColumn);
    procedure ColorEnter(Sender: TObject);
    procedure ColorExit(Sender: TObject);
    procedure ColorExitSinCeros(Sender: TObject);
    procedure cEmpresaBusChange(Sender: TObject);
    procedure Primero(Sender: TObject);
    procedure Anterior(Sender: TObject);
    procedure Siguiente(Sender: TObject);
    procedure Ultimo(Sender: TObject);
    procedure ClientDataSet1AfterScroll(DataSet: TDataSet);
    procedure cClienteBusChange(Sender: TObject);
    procedure cArticuloBusChange(Sender: TObject);
    procedure cFamiliaBusChange(Sender: TObject);
    procedure ClientDataSet1CalcFields(DataSet: TDataSet);
    procedure cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaEmpresasClick(Sender: TObject);
    procedure cLupaClientesClick(Sender: TObject);
    procedure cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaFamiliasClick(Sender: TObject);
    procedure cFamiliaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cLupaArticulosClick(Sender: TObject);
    procedure cArticuloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure cTipoLoteBusKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    TextoSql: String;
    PosRegistro, NRegistros: Integer;
    procedure Mensaje(Texto: String );
    procedure BotonesPosicion;

  public
       { Public declarations }
       EmpresaBus, ClienteBus, LoteBus: String;
       EmpresaParam, WhereBus: String;
  end;

var
   BusquedaAlmacenes: TBusquedaAlmacenes;

implementation

uses MBaseDatos, UGLobal;

{$R *.dfm}

//----------------------- BOTON NUEVA BUSQUEDA ---------------------------------
procedure TBusquedaAlmacenes.NuevaBusqueda(Sender: TObject);
begin
     Self.Height :=644;
     Self.width:=554;
     BarraEstado.Panels[0].Width:=380
     ;
     GridLineas.TabStop:=False;
     PanelDatos.Enabled:=False;
     PanelDatos.Visible:=False;
     PanelClaves.Visible:=True;
     Query1.Close;
     ClientDataSet1.Close;
     cEmpresaBus.SetFocus;
     cEmpresaBus.Text:='';
     cClienteBus.Text:='';
     cFamiliaBus.Text:='';
     cArticuloBus.Text:='';
     cLoteBus.Text:='';
     cTipoLoteBus.Text:='';
     cBultosEnt.Text:='';
     cBultosSal.Text:='';
     cUnidadeEnt.Text:='';
     cUnidadesSal.Text:='';
     cUnidadesSalMismoDia.Text:='';
     cDestruidas.Text:='';
     cMermas.Text:='';
     cEstuchesBulto.Text:='';
     cEstuchesSueltos.Text:='';
     cEstuchesTotales.Text:='';
     cPaletsEnt.Text:='';
     cPaletsSal.Text:='';
     cCamara.Text:='';
     cZona.Text:='';
     cRetenido.Checked:=False;

     NRegistros:=0;
     PosRegistro:=0;
     BotonesPosicion();

     cEmpresaBus.Text:=EmpresaParam;
     cClienteBus.SetFocus;
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaAlmacenes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (Key=VK_F5) and BAceptar.Enabled then  //F5 aceptar
        Aceptar(Self)
     else if Key=40 then                             //Flecha arriba
             PostMessage(Handle,WM_NEXTDLGCTL,0,0)
          else if Key=38 then                        //Flecha abajo
                  PostMessage(Handle,WM_NEXTDLGCTL,1,0);
end;

//--------------------- CONTROL DE PULSACIONES DE TECLADO ----------------------
procedure TBusquedaAlmacenes.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=#13 then  //Enter
     begin
          if (GridLineas.Focused) and (not ClientDataSet1.IsEmpty) then  //Foco en el Grid y existen datos
              GridLineasDblClick(Self)
          else
          begin
               Key:=#0;
               PostMessage(Handle,WM_NEXTDLGCTL,0,0);
          end;
     end
     else if Key=#27 then  //Esc
          begin
               Key:=#0;
               if BCancelar.Enabled then
                  Cancelar(Self)
               else
                   Close;
          end;
end;

//----------------------- BOTON ACEPTAR ----------------------------------------
procedure TBusquedaAlmacenes.Aceptar(Sender: TObject);
//Var
   //HayWhere: Boolean;
begin
     NRegistros:=0;
     PosRegistro:=0;
     //HayWhere:=False;
     if not ClientDataSet1.Active then
     begin
          WhereBus:='';
          Query1.SQL.Clear;
          Query1.SQL.Add(' SELECT * ' +
                         ' FROM ALMACENES, CLIENTES, ARTICULOS ' +
                         ' WHERE EMPRESA_C=EMPRESA_AL ' +
                         ' AND CODIGO_C=CLIENTE_AL ' +
                         ' AND EMPRESA_A=EMPRESA_AL ' +
                         ' AND FAMILIA_A=FAMILIA_AL ' +
                         ' AND CODIGO_A=ARTICULO_AL ' );
          if cEmpresaBus.Text<>'' then
             WhereBus:=' EMPRESA_AL=' + QuotedStr(RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I'));
          if cClienteBus.Text<>'' then
             WhereBus:=WhereBus + ' AND CLIENTE_AL=' + QuotedStr(RellenarCeros(cClienteBus.Text,cClienteBus.MaxLength,'I'));
          if cFamiliaBus.Text<>'' then
             WhereBus:=WhereBus + ' AND FAMILIA_AL=' + QuotedStr(RellenarCeros(cFamiliaBus.Text,cFamiliaBus.MaxLength,'I'));
          if cArticuloBus.Text<>'' then
             WhereBus:=WhereBus + ' AND ARTICULO_AL=' + QuotedStr(RellenarCeros(cArticuloBus.Text,cArticuloBus.MaxLength,'I'));
          if cLoteBus.Text<>'' then
             WhereBus:=WhereBus + ' AND LOTE_AL=' + QuotedStr(cLoteBus.Text);
          if cTipoLoteBus.Text<>'' then
             WhereBus:=WhereBus + ' AND TIPO_LOTE_AL=' + QuotedStr(Copy(cTipoLoteBus.Text,1,1));
          //Bultos Entrados
          if cBultosEnt.Text<>'' then
             WhereBus:=WhereBus + ' AND BULTOS_ENTRADOS_AL=' + cBultosEnt.Text;
          //Bultos Salidos
          if cBultosSal.Text<>'' then
             WhereBus:=WhereBus + ' AND BULTOS_SALIDOS_AL=' + cBultosSal.Text;
          //Unidades Entradas
          if cUnidadeEnt.Text<>'' then
             WhereBus:=WhereBus + ' AND UNIDADES_ENTRADAS_AL=' + cUnidadeEnt.Text;
          //Unidades Salidas
          if cUnidadesSal.Text<>'' then
             WhereBus:=WhereBus + ' AND UNIDADES_SALIDAS_AL=' + cUnidadesSal.Text;
          //Unidades Salidas el Mismo Dia
          if cUnidadesSalMismoDia.Text<>'' then
             WhereBus:=WhereBus + ' AND UNID_SAL_MISMO_DIA_AL=' + cUnidadesSalMismoDia.Text;
          //Unidades Destruidas
          if cDestruidas.Text<>'' then
             WhereBus:=WhereBus + ' AND UNIDADES_DESTRUIDAS_AL=' + cDestruidas.Text;
          //Unidades Mermas
          if cMermas.Text<>'' then
             WhereBus:=WhereBus + ' AND UNIDADES_MERMAS_AL=' + cMermas.Text;
          //Estuches por bulto
          if cEstuchesBulto.Text<>'' then
             WhereBus:=WhereBus + ' AND ESTUCHES_BULTO_AL=' + cEstuchesBulto.Text;
          //Estuches Sueltos
          if cEstuchesSueltos.Text<>'' then
             WhereBus:=WhereBus + ' AND ESTUCHES_SUELTOS_AL=' + cEstuchesSueltos.Text;
          //Estuches Totales
          if cEstuchesTotales.Text<>'' then
             WhereBus:=WhereBus + ' AND ESTUCHES_TOTALES_AL=' + cEstuchesTotales.Text;
          //Palets Entrados
          if cPaletsEnt.Text<>'' then
             WhereBus:=WhereBus + ' AND PALETS_ENTRADOS_AL=' + cPaletsEnt.Text;
          //Palets Salidos
          if cPaletsSal.Text<>'' then
             WhereBus:=WhereBus + ' AND PALETS_SALIDOS_AL=' + cPaletsSal.Text;
          //Camara
          if cCamara.Text<>'' then
             WhereBus:=WhereBus + ' AND NUMERO_CAMARA_AL=' + cCamara.Text;
          //Zona
          if cZona.Text<>'' then
             WhereBus:=WhereBus + ' AND ZONA_AL=' + QuotedStr(cZona.Text);
          //Retenido
          if cRetenido.Checked then
             WhereBus:=WhereBus + ' AND STATUS_RETENIDO_AL=' + QuotedStr('S')
          else
              WhereBus:=WhereBus + ' AND STATUS_RETENIDO_AL=' + QuotedStr('N');

          if WhereBus<>'' then
             Query1.SQL.Add(' AND ' + WhereBus)
          else
              Query1.SQL.Add(WhereBus);
          TextoSql:=Query1.SQL.Text;
          Query1.SQL.Add(' ORDER BY EMPRESA_AL, CLIENTE_AL, FAMILIA_AL, ARTICULO_AL, LOTE_AL, TIPO_LOTE_AL');
          Query1.Open;
          if not Query1.IsEmpty then
          begin
               ClientDataSet1.Open;
               Self.Height:=521;
               Self.Width:=932;
               BarraEstado.Panels[0].Width:=700;
               PanelClaves.Visible:=False;
               PanelDatos.Enabled:=True;
               PanelDatos.Visible:=True;
               GridLineas.TabStop:=True;
               GridLineas.SetFocus;
               try    //Contamos los Registros
                  With QContar do
                  begin
                       Close;
                       SQL.Clear;
                       SQL.Add(' SELECT COUNT(*) AS NREGISTROS ' +
                               ' FROM ALMACENES ' +
                               ' WHERE ' +
                               WhereBus);
                       Open;
                       NRegistros:=FieldByName('NRegistros').AsInteger;  //Contamos los registros
                       PosRegistro:=1;
                   end;
               finally
                      QContar.Close;
               end;
          end
          else
          begin
               Mensaje('No existen datos');
               Query1.Close;
               ClientDataSet1.Close;
          end;
          BotonesPosicion();
     end
     else
         ModalResult:=mrOk;
end;

//----------------------- BOTON CANCELAR ---------------------------------------
procedure TBusquedaAlmacenes.Cancelar(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

//----------------------------- DOBLE CLICK EN EL GRID -------------------------
procedure TBusquedaAlmacenes.GridLineasDblClick(Sender: TObject);
begin
     EmpresaBus:=ClientDataSet1.FieldByName('EMPRESA_AL').AsString;
     ClienteBus:=ClientDataSet1.FieldByName('CLIENTE_AL').AsString;
     LoteBus:=ClientDataSet1.FieldByName('LOTE_AL').AsString;
     ModalResult:=mrOk;
end;

//--------------------- MENSAJES DE LA BARRA DE ESTADO -------------------------
procedure TBusquedaAlmacenes.Mensaje(Texto: String );
begin
     if BarraEstado.SimplePanel then
        BarraEstado.SimpleText:=Texto
     else if BarraEstado.Panels.Count=0 then
          begin
               BarraEstado.SimplePanel:=True;
               BarraEstado.SimpleText:=Texto;
          end
          else
              BarraEstado.Panels[0].Text:=Texto;
     Timer1.Enabled := false;
     Timer1.Enabled := true;
end;

//--------------------- TIMER PARALOS MENSAJES ---------------------------------
procedure TBusquedaAlmacenes.Timer1Timer(Sender: TObject);
begin
     if BarraEstado.SimplePanel then
         BarraEstado.SimpleText:=''
     else if BarraEstado.Panels.Count=0 then
          begin
               BarraEstado.SimplePanel:=True;
               BarraEstado.SimpleText:='';
          end
          else
              BarraEstado.Panels[0].Text:='';
     Timer1.Enabled:=False;
end;

//------------------------ CREACION DEL FORMULARIO -----------------------------
procedure TBusquedaAlmacenes.FormCreate(Sender: TObject);
begin
     Self.Height:=644;
     Self.width:=554;
     PosRegistro:=0;
     NRegistros:=0;
end;

//----------------------- ORDENACION DE LOS DATOS DEL GRID ---------------------
procedure TBusquedaAlmacenes.GridLineasTitleClick(Column: TColumn);
Var
   Columna: String;
begin
     ClientDataSet1.Close;
     Query1.Close;
     Query1.SQL.Clear;
     if Column.FieldName<>'Fecha' then
        Columna:=Column.FieldName
     else
         Columna:='Fecha_Entrada_al';
     Query1.SQL.Add(TextoSql +
                    ' ORDER BY ' + Columna);
     Query1.Open;
     ClientDataSet1.Open;
end;

//---------------------- PONE EL COLOR DEL FOCO --------------------------------
procedure TBusquedaAlmacenes.ColorEnter(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clMoneyGreen;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TBusquedaAlmacenes.ColorExit(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
     begin
          TEdit(Sender).Color:=clWindow;
          if Length(TEdit(Sender).Text)>0 then
             TEdit(Sender).Text:=RellenarCeros(TEdit(Sender).Text,TEdit(Sender).MaxLength,'I');
     end
     else if Sender is TComboBox then           //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow;
end;

//---------------------- QUITA EL COLOR DEL FOCO -------------------------------
procedure TBusquedaAlmacenes.ColorExitSinCeros(Sender: TObject);
begin
     if Sender is TEdit then           //Si el componente es un TDBEdit
        TEdit(Sender).Color:=clWindow
     else if Sender is TComboBox then  //Si el componente es un TComboBox
             TComboBox(Sender).Color:=clWindow;
end;

//----------------------- CAMBIO DE LA EMPRESA ---------------------------------
procedure TBusquedaAlmacenes.cEmpresaBusChange(Sender: TObject);
Var
   Empresa, Familia: String;
begin
     Empresa:=RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I');
     Familia:=RellenarCeros(cFamiliaBus.Text,cFamiliaBus.MaxLength,'I');

     tNomEmpresa.Caption:=NomEmpresa(Empresa);
     tNomCliente.Caption:=NomCliente(Empresa, RellenarCeros(cClienteBus.Text,cClienteBus.MaxLength,'I'));
     tNomFamilia.Caption:=NomFamilia(Empresa, Familia);
     tNomArticulo.Caption:=NomArticulo(Empresa, Familia,
                                       RellenarCeros(cArticuloBus.Text,cArticuloBus.MaxLength,'I'));
end;

//-------------------------- PRIMER REGISTRO -----------------------------------
procedure TBusquedaAlmacenes.Primero(Sender: TObject);
begin
     ClientDataSet1.First;
end;

//-------------------------- REGISTRO ANTERIOR ---------------------------------
procedure TBusquedaAlmacenes.Anterior(Sender: TObject);
begin
     ClientDataSet1.Prior;
end;

//-------------------------- REGISTRO SIGUIENTE --------------------------------
procedure TBusquedaAlmacenes.Siguiente(Sender: TObject);
begin
     ClientDataSet1.Next;
end;

//-------------------------- ULTIMO REGISTRO -----------------------------------
procedure TBusquedaAlmacenes.Ultimo(Sender: TObject);
begin
     ClientDataSet1.Last;
end;

//-------------- HABILITAR BOTONES DE POSICION DE REGISTRO ---------------------
procedure TBusquedaAlmacenes.BotonesPosicion;
begin
     if NRegistros<=1 then    //1 o ningun registro
     begin
          BPrimero.Enabled:=False;
          BAnterior.Enabled:=False;
          BSiguiente.Enabled:=False;
          BUltimo.Enabled:=False;
     end
     else if PosRegistro=NRegistros then   //Ultimo registro
          begin
               BPrimero.Enabled:=True;
               BAnterior.Enabled:=True;
               BSiguiente.Enabled:=False;
               BUltimo.Enabled:=False;
          end
          else if PosRegistro=1 then   //Primer registro
               begin
                    BPrimero.Enabled:=False;
                    BAnterior.Enabled:=False;
                    BSiguiente.Enabled:=True;
                    BUltimo.Enabled:=True;
               end
               else      //Registros del centro
               begin
                    BPrimero.Enabled:=True;
                    BAnterior.Enabled:=True;
                    BSiguiente.Enabled:=True;
                    BUltimo.Enabled:=True;
               end;
      BarraEstado.Panels[1].Text := 'Registro ' + IntToStr(PosRegistro) + ' de ' +  IntToStr(NRegistros);
end;

//-------------------- AL CAMBIAR DE REGISTRO ----------------------------------
procedure TBusquedaAlmacenes.ClientDataSet1AfterScroll(DataSet: TDataSet);
begin
     PosRegistro:=ClientDataSet1.RecNo;
     BotonesPosicion();
end;

//-------------------- AL CAMBIAR EL CLIENTE -----------------------------------
procedure TBusquedaAlmacenes.cClienteBusChange(Sender: TObject);
begin
     tNomCliente.Caption:=NomCliente(cEmpresaBus.Text, RellenarCeros(cClienteBus.Text,cClienteBus.MaxLength,'I'));
end;

//-------------------- AL CAMBIAR EL ARTICULO ----------------------------------
procedure TBusquedaAlmacenes.cArticuloBusChange(Sender: TObject);
begin
     tNomArticulo.Caption:=NomArticulo(cEmpresaBus.Text,
                                       cFamiliaBus.Text,
                                       RellenarCeros(cArticuloBus.Text,cArticuloBus.MaxLength,'I'));
end;

//-------------------- AL CAMBIAR LA FAMILIA -----------------------------------
procedure TBusquedaAlmacenes.cFamiliaBusChange(Sender: TObject);
Var
   Familia: String;
begin
     Familia:=RellenarCeros(cFamiliaBus.Text,cFamiliaBus.MaxLength,'I');

     tNomFamilia.Caption:=NomFamilia(cEmpresaBus.Text, Familia);
     tNomArticulo.Caption:=NomArticulo(cEmpresaBus.Text,
                                       Familia,
                                       cArticuloBus.Text);
end;

//-------------------- CALCULO DE CAMPOS CALCULADOS ----------------------------
procedure TBusquedaAlmacenes.ClientDataSet1CalcFields(DataSet: TDataSet);
begin
     //Cambia el formato de la fecha de entrada al visualizar (YYYY/MM/DD --> DD/MM/YYYY)
     ClientDataSet1.FieldByName('Fecha').AsString:=DiaMesAnyo(ClientDataSet1.FieldByName('Fecha_Entrada_al').AsString);
end;

//-------------------------- LUPA (F2) DE EMPRESAS -----------------------------
procedure TBusquedaAlmacenes.cEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaEmpresasClick(Self);
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TBusquedaAlmacenes.cLupaEmpresasClick(Sender: TObject);
Var
   CodEmpresa: String;
begin
     CodEmpresa:=LupaEmpresas();
     if CodEmpresa<>'' then
        cEmpresaBus.Text:=CodEmpresa;
     cEmpresaBus.SetFocus;
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
procedure TBusquedaAlmacenes.cLupaClientesClick(Sender: TObject);
Var
   CodCliente: String;
begin
     if cEmpresaBus.Text<>'' then
     begin
          CodCliente:=LupaClientes(RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I'));
          if CodCliente<>'' then
             cClienteBus.Text:=CodCliente;
          cClienteBus.SetFocus;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresaBus.SetFocus;
     end;
end;

//-------------------------- LUPA (F2) DE CLIENTES -----------------------------
procedure TBusquedaAlmacenes.cClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaClientesClick(Self);
end;

//-------------------------- LUPA DE FAMILIAS-----------------------------------
procedure TBusquedaAlmacenes.cLupaFamiliasClick(Sender: TObject);
Var
   Familia: String;
begin
     if cEmpresaBus.Text<>'' then
     begin
          Familia:=LupaFamilias(RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I'));
          if Familia<>'' then
             cFamiliaBus.Text:=Familia;
          cFamiliaBus.SetFocus;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresaBus.SetFocus;
     end;
end;

//-------------------------- LUPA (F2) DE FAMILIAS -----------------------------
procedure TBusquedaAlmacenes.cFamiliaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaFamiliasClick(Self);
end;

//-------------------------- LUPA DE ARTICULOS ---------------------------------
procedure TBusquedaAlmacenes.cLupaArticulosClick(Sender: TObject);
Var
   Articulo, Familia: String;
begin
     if cEmpresaBus.Text<>'' then
     begin
          if tNomFamilia.Caption<>'' then
          begin
               Familia:=RellenarCeros(cFamiliaBus.Text,cFamiliaBus.MaxLength,'I');
               Articulo:=LupaArticulos(RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I'),
                                       Familia);
               cArticuloBus.SetFocus
          end
          else
          begin
               Familia:='';
               Articulo:=LupaArticulos(cEmpresaBus.Text, Familia);
               cArticuloBus.SetFocus;
          end;

{          if cFamiliaBus.Text<>'' then
             Articulo:=LupaArticulos(RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I'),
                                     RellenarCeros(cFamiliaBus.Text,cFamiliaBus.MaxLength,'I'))
          else
              Articulo:=LupaFamiliaArticulos(RellenarCeros(cEmpresaBus.Text,cEmpresaBus.MaxLength,'I'),Familia);
}          if Articulo<>'' then
          begin
               cArticuloBus.Text:=Articulo;
               if Familia<>'' then
                  cFamiliaBus.Text:=Familia;
          end;
     end
     else
     begin
          MessageDlg (Chr(13) + 'Seleccione antes la empresa', mtError,[mbOk],0);
          cEmpresaBus.SetFocus;
     end;
end;

//-------------------------- LUPA (F2) DE ARTICULOS ----------------------------
procedure TBusquedaAlmacenes.cArticuloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if Key=VK_F2 then
        cLupaArticulosClick(Self);
end;

procedure TBusquedaAlmacenes.FormActivate(Sender: TObject);
begin
     cEmpresaBus.Text:=EmpresaParam;
     cClienteBus.SetFocus;
end;

procedure TBusquedaAlmacenes.cTipoLoteBusKeyPress(Sender: TObject; var Key: Char);
Var
   Pulsacion: char;
begin
     Pulsacion:=UpCase(Key);
     if (Pulsacion='N') or (Pulsacion='B') or (Pulsacion='T') or (Pulsacion='I') or (Pulsacion='R') then
     begin
          cTipoLoteBus.Text:='';
          Key:=Pulsacion;
     end;
end;

end.
