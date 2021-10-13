unit MBaseDatos;

interface

uses
  SysUtils, Classes, ImgList, Controls, DB, DBTables, cxGraphics;

type
  TDMBaseDatos = class(TDataModule)
    Imagenes: TImageList;
    BDFrigo: TDatabase;
    ImagenesNew: TcxImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   DMBaseDatos: TDMBaseDatos;

implementation

{$R *.dfm}

end.
