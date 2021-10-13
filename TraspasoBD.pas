unit TraspasoBD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBTables;

type
  TFTraspasoBD = class(TForm)
    BCobros: TButton;
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BCobrosClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTraspasoBD: TFTraspasoBD;

implementation

uses MBaseDatos;

{$R *.dfm}

procedure TFTraspasoBD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFTraspasoBD.BCobrosClick(Sender: TObject);
Var
   QAux: TQuery;
   QAux2: TQuery;
begin
     QAux:=TQuery.Create(nil);
     QAux2:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux.SQL.Add('SELECT * FROM RICARDO ');

        QAux2.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux2.SQL.Add('INSERT INTO COBROS(empresa_co,cliente_co,factura_co,fecha_factura_co,fecha_pago_co,tipo_cobro_co,importe_co) ' +
                     'VALUES(:empresa,:cliente,:factura,:fecha_factura,:fecha_pago,:tipo_cobro,:importe)');
        QAux2.Prepare;

        QAux.Open;
        While not QAux.Eof do
        begin
             QAux2.ParamByName('empresa').AsString:=QAux.FieldByName('empresa_co').AsString;
             QAux2.ParamByName('cliente').AsString:=QAux.FieldByName('cliente_co').AsString;
             QAux2.ParamByName('factura').AsInteger:=QAux.FieldByName('factura_co').AsInteger;
             QAux2.ParamByName('fecha_factura').AsDateTime:=QAux.FieldByName('fecha_factura_co').AsDateTime;
             QAux2.ParamByName('fecha_pago').AsDateTime:=QAux.FieldByName('fecha_pago_co').AsDateTime;
             QAux2.ParamByName('tipo_cobro').AsString:=QAux.FieldByName('tipo_cobro_co').AsString;
             QAux2.ParamByName('importe').AsFloat:=QAux.FieldByName('importe_co').AsFloat;
             QAux2.ExecSQL;

             QAux.Next;
        end;



     finally
            QAux.Close;
            FreeAndNil(QAux);
            QAux2.Close;
            FreeAndNil(QAux2);
     end;
end;

//Rellena la familia en las lineas de entrada
procedure TFTraspasoBD.Button1Click(Sender: TObject);
Var
   QAux: TQuery;
   QAux2: TQuery;
   QAux3: TQuery;
   i: Integer;
begin
     QAux:=TQuery.Create(nil);
     QAux2:=TQuery.Create(nil);
     QAux3:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux.SQL.Add('SELECT * FROM LINEA_ENTRADAS ');

        QAux2.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux2.SQL.Add('SELECT * FROM ARTICULOS ' +
                      ' WHERE EMPRESA_A=:Empresa' +
                      ' AND CODIGO_A=:Articulo');
        QAux2.Prepare;

        QAux3.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux3.SQL.Add('UPDATE LINEA_ENTRADAS ' +
                      'SET FAMILIA_LE=:Familia ' +
                      'WHERE EMPRESA_LE=:Empresa ' +
                      'AND ALBARAN_LE=:Albaran ' +
                      'AND LOTE_LE=:Lote');
        QAux3.Prepare;

        QAux.Open;
        i:=0;
        While not QAux.Eof do
        begin
             QAux2.Close;
             QAux2.ParamByName('empresa').AsString:=QAux.FieldByName('empresa_le').AsString;
             QAux2.ParamByName('articulo').AsString:=QAux.FieldByName('articulo_le').AsString;
             QAux2.Open;

             QAux3.ParamByName('Familia').AsString:=QAux2.FieldByName('familia_a').AsString;
             QAux3.ParamByName('Empresa').AsString:=QAux.FieldByName('empresa_le').AsString;
             QAux3.ParamByName('Albaran').AsString:=QAux.FieldByName('albaran_le').AsString;
             QAux3.ParamByName('Lote').AsString:=QAux.FieldByName('lote_le').AsString;
             QAux3.ExecSql;

             QAux.Next;
             i:=i+1;
        end;
        showmessage(inttostr(i));
     finally
            QAux.Close;
            FreeAndNil(QAux);
            QAux2.Close;
            FreeAndNil(QAux2);
            QAux3.Close;
            FreeAndNil(QAux3);
     end;
end;

//Rellena la familia en las lineas de salida
procedure TFTraspasoBD.Button2Click(Sender: TObject);
Var
   QAux: TQuery;
   QAux2: TQuery;
   QAux3: TQuery;
   i: Integer;
begin
     QAux:=TQuery.Create(nil);
     QAux2:=TQuery.Create(nil);
     QAux3:=TQuery.Create(nil);
     try
        QAux.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux.SQL.Add('SELECT * FROM LINEA_SALIDAS ');

        QAux2.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux2.SQL.Add('SELECT * FROM ARTICULOS ' +
                      ' WHERE EMPRESA_A=:Empresa' +
                      ' AND CODIGO_A=:Articulo');
        QAux2.Prepare;

        QAux3.DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
        QAux3.SQL.Add('UPDATE LINEA_SALIDAS ' +
                      'SET FAMILIA_LS=:Familia ' +
                      'WHERE EMPRESA_LS=:Empresa ' +
                      'AND ALBARAN_LS=:Albaran ' +
                      'AND LOTE_LS=:Lote');
        QAux3.Prepare;

        QAux.Open;
        i:=0;
        While not QAux.Eof do
        begin
             QAux2.Close;
             QAux2.ParamByName('empresa').AsString:=QAux.FieldByName('empresa_ls').AsString;
             QAux2.ParamByName('articulo').AsString:=QAux.FieldByName('articulo_ls').AsString;
             QAux2.Open;

             QAux3.ParamByName('Familia').AsString:=QAux2.FieldByName('familia_a').AsString;
             QAux3.ParamByName('Empresa').AsString:=QAux.FieldByName('empresa_ls').AsString;
             QAux3.ParamByName('Albaran').AsString:=QAux.FieldByName('albaran_ls').AsString;
             QAux3.ParamByName('Lote').AsString:=QAux.FieldByName('lote_ls').AsString;
             QAux3.ExecSql;

             QAux.Next;
             i:=i+1;
        end;
        showmessage(inttostr(i));
     finally
            QAux.Close;
            FreeAndNil(QAux);
            QAux2.Close;
            FreeAndNil(QAux2);
            QAux3.Close;
            FreeAndNil(QAux3);
     end;
end;

end.
