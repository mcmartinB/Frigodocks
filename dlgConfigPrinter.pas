unit dlgConfigPrinter;

interface

uses
  SysUtils, Forms, quickrpt, Spin, Classes, Controls, StdCtrls, Buttons;

type
  TDConfigPrinter = class(TForm)
    cbImpresoras: TComboBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    NumeroCopias: TSpinEdit;
    Label2: TLabel;
    Rango: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label3: TLabel;
    Desde: TEdit;
    Hasta: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure RadioButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Execute(Impresora, Hojas, Copias:Integer; ViewRange: Boolean):Boolean;
  end;

implementation

uses Printers;

{$R *.DFM}

function TDConfigPrinter.Execute(Impresora, Hojas, Copias:Integer; ViewRange: Boolean):Boolean;
begin
  {Ver rango de hojas}
  Rango.Visible := ViewRange;

  {Impresora seleccionada}
  if Impresora=-1 then
    cbImpresoras.ItemIndex:=Printer.PrinterIndex
  else
    cbImpresoras.ItemIndex:=Impresora;

  {Numero de copias}
  NumeroCopias.Text:=IntToStr(Copias);

  {Rango de hojas a imprimir}
  Desde.Text:='1';
  Hasta.Text:=IntToStr(Hojas);

  if ShowModal=mrOk then Result:=True
  else Result:=False;
end;

procedure TDConfigPrinter.FormCreate(Sender: TObject);
var
  i:Integer;
begin
  {Rellenar combo con el nombre de las impresoras}
  cbImpresoras.Clear;
  for i:=0 to Printer.Printers.Count-1 do
  begin
    cbImpresoras.Items.Add(Printer.Printers[i]);
    cbImpresoras.ItemIndex:=0;
  end;
end;

procedure TDConfigPrinter.RadioButtonClick(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
    Desde.Enabled:=False;
    Hasta.Enabled:=False;
  end
  else
  if RadioButton2.Checked then
  begin
    Desde.Enabled:=True;
    Hasta.Enabled:=True;
  end;
end;

end.
