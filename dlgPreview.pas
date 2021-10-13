(* ¿filtros PSQREPORT? *)
(* QUE PASA CON LOS COMPOSITE REPORTS*)
unit dlgPreview;

interface

uses
  Classes, Controls, Forms, ComCtrls, StdCtrls, Buttons, ExtCtrls, ActnList,
  {mini}Windows, SysUtils, Dialogs, ImgList, Spin, QRPrntr, QRExport, {PsQrExport,}
  untInterfaces, {dMessage,} IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdSMTP, IdMessage,
  IdExplicitTLSClientServerBase, IdSMTPBase,{gtClasses,} {tCstDocEng,}
  {gtCstPlnEng, gtCstPDFEng, gtExPDFEng, gtPDFEng, gtXportIntf,}
  {gtQRXportIntf, gtCstDocEng,} IniFiles, IdAttachmentFile;

type
  TPreviewInterface = class(TQRPreviewInterface)
  public
    function Show(AQRPrinter : TQRPrinter) : TWinControl; override;
    function ShowModal(AQRPrinter : TQRPrinter): TWinControl; override;
  end;

  TDPreview = class(TForm)
    QRPreview: TQRPreview;
    stbEstado: TStatusBar;
    Botonera: TPanel;
    btnImprimir: TSpeedButton;
    btnConfigurar: TSpeedButton;
    btnAmpliar: TSpeedButton;
    btnDisminuir: TSpeedButton;
    btnAlto: TSpeedButton;
    btnGuardar: TSpeedButton;
    btnPrimera: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnSiguiente: TSpeedButton;
    btnUltima: TSpeedButton;
    aclAcciones: TActionList;
    imlImagenes: TImageList;
    AImprimir: TAction;
    AConfigurar: TAction;
    APrimera: TAction;
    AAnterior: TAction;
    ASiguiente: TAction;
    AUltima: TAction;
    AAumentar: TAction;
    ADisminuir: TAction;
    AAlto: TAction;
    ASalvar: TAction;
    ACerrar: TAction;
    prbProgreso: TProgressBar;
    spePaginas: TSpinEdit;
    AArriba: TAction;
    AAbajo: TAction;
    AIzquierda: TAction;
    ADerecha: TAction;
    SpeedButton1: TSpeedButton;
    ACorreo: TAction;
    btnSalir: TSpeedButton;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel2: TBevel;
    spCopias: TSpinEdit;
    Bevel5: TBevel;
    Label1: TLabel;
    Bevel6: TBevel;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    PanelMsg: TPanel;
    MsgEnviar: TLabel;
    procedure AccionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRPreviewPageAvailable(Sender: TObject; PageNum: Integer);
    procedure QRPreviewProgressUpdate(Sender: TObject; Progress: Integer);
    procedure spePaginasChange(Sender: TObject);
    procedure AJumpExecute(Sender: TObject);
    procedure spCopiasChange(Sender: TObject);
  private
    { Private declarations }
    FQRPrinter:TQRPrinter;
    sStatus:string;
    Title:string;

    procedure ActualizaBotones;
    procedure ActualizaBtnZoom;

    procedure IrPrimeraHoja;
    procedure IrUltimaHoja;
    procedure IrHojaAnterior;
    procedure IrHojaSiguiente;
    procedure VerPagina;
    procedure DesplazarAbajo;
    procedure DesplazarArriba;
    procedure DesplazarIzquierda;
    procedure DesplazarDerecha;

    procedure ZoomAmpliar;
    procedure ZoomDisminuir;
    procedure ZoomOriginal;
    procedure ZoomAncho;
    procedure ZoomAlto;

    procedure Imprimir;
    procedure Configurar;
    procedure ActualizaImpresora;

    procedure Guardar_old;
    procedure Guardar;
    procedure Abrir;
    procedure CorreoElectronico;
    procedure CorreoElectronico_old;

    function TransformarNombre(AFileName: string; AExt: string): String;

  public
    { Public declarations }
    toWidth,toFit:Integer;
    Empresa: String;

    procedure PreviewFile(FileName:string);

    constructor CreatePreview(AOwner : TComponent; aQRPrinter : TQRPrinter);
    property QRPrinter : TQRPrinter read FQRPrinter write FQRPrinter;
  end;

var
  PorDefecto:Boolean;
  ForcePrint,DistinctCopys:Boolean;
  Copias:Integer;

implementation

uses quickrpt, Printers, dlgConfigPrinter, UGLobal, FPrincipal, QRPDFFilt, StrUtils;

{$R *.DFM}

//*************************************************************************
//REGISTRO DEL PREVISUALIZADOR
//*************************************************************************
function TPreviewInterface.Show(AQRPrinter : TQRPrinter) : TWinControl;
begin
  //Para que los form maximizados aparezcan desde el inicio maximizados
  //LockWindowUpdate(Application.MainForm.Handle); ??????????????????????
  try
    if PorDefecto=True then begin
      ForcePrint:=False;
      DistinctCopys:=False;
      Copias:=1;
    end;
    Result := TDPreview.CreatePreview(Application, AQRPrinter);
    TDPreview(Result).Show;
  finally
    LockWindowUpdate(0);
  end;
end;

function TPreviewInterface.ShowModal(AQRPrinter : TQRPrinter) : TWinControl;
begin
  Result := TDPreview.CreatePreview(Application, AQRPrinter);
  TDPreview(Result).ShowModal;
end;
//*************************************************************************
//FIN REGISTRO DEL PREVISUALIZADOR
//*************************************************************************

//*************************************************************************
//EVENTOS FORMULARIO
//*************************************************************************
(*procedure TDPreview.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
end;*)

procedure TDPreview.FormCreate(Sender: TObject);
begin
  //Para poder dibujar la barra de progreso sobre la barra de estado
  prbProgreso.Visible:=False;
  prbProgreso.Parent:=stbEstado;

  //Teclas rapidas
  AImprimir.ShortCut:=$49; //VK_I
  AConfigurar.ShortCut:=$43; //VK_C
  ASalvar.ShortCut:=$53; //VK_S
  ACerrar.ShortCut:=VK_ESCAPE;
  ACorreo.ShortCut:=$45;//VK_E

  APrimera.ShortCut:=VK_HOME;
  aAnterior.ShortCut:=VK_PRIOR;
  ASiguiente.ShortCut:=VK_NEXT;
  AUltima.ShortCut:=VK_END;

  AAbajo.ShortCut:=VK_DOWN;
  AArriba.ShortCut:=VK_UP;
  AIzquierda.ShortCut:=VK_LEFT;
  ADerecha.ShortCut:=VK_RIGHT;

  AAumentar.ShortCut:=VK_ADD;
  ADisminuir.ShortCut:=VK_SUBTRACT;
  AAlto.ShortCut:=VK_RETURN;

  //Numero de copias
  spCopias.Value:=copias;

//  gtPDFEngine1.Preferences.ShowSetupDialog:=False;
end;

procedure TDPreview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QRPrinter.ClosePreview(Self);

  //Avisamos que hemos acavado
  //SendMessage(Application.MainForm.Handle, BM_PREVIEWNOTIFY, Ord(enClose), 0);

  //Por defecto los parametros por defecto
  PorDefecto:=True;

  //Liberamos el report cargado
  if QRPrinter.Master=nil then QRPrinter.Free;
  Action := caFree;
end;

procedure TDPreview.FormShow(Sender: TObject);
begin
  //Avisamos que vamos a mostar el preview
 //SendMessage(Application.MainForm.Handle, BM_PREVIEWNOTIFY, Ord(enOpen), 0); ????????????????????????

  //Titulo del previsualizador
  if QRPreview.QRPrinter.Title = ''
  then Caption := 'Reporte sin nombre'
  else Caption := QRPreview.QRPrinter.Title;
  Title:=Caption;
end;
//*************************************************************************
//FIN EVENTOS FORMULARIO
//*************************************************************************

//*************************************************************************
//EVENTOS DEL PREVIEW
//*************************************************************************
constructor TDPreview.CreatePreview(AOwner : TComponent; aQRPrinter : TQRPrinter);
var
  i:integer;
begin
  inherited Create(AOwner);
  QRPrinter := aQRPrinter;
  // Connect the preview component to the report's qrprinter object
  QRPreview.QRPrinter := aQRPrinter;
  //Deshabilitamos botones hasta finalizar con la generacion del listado
  for i:=0 to Botonera.ControlCount-1 do
  begin
    Botonera.Controls[i].Enabled:=False;
  end;
end;

procedure TDPreview.QRPreviewPageAvailable(Sender: TObject;
  PageNum: Integer);
var
  i:integer;
begin
  Caption:=Title+' - Pagina 1 de '+IntToStr(PageNum);
  case QRPreview.QRPrinter.Status of
    mpReady: sStatus := 'Leyendo';
    mpBusy: sStatus := 'Ocupado';
    mpFinished:
    begin
      sStatus := 'Finalizado';
      prbProgreso.Visible:=False; //Oculto el Gauge cuando finalizo.

      //Reporte sin datos
      if QRPreview.QRPrinter.PageCount=0 then begin
        Caption:=Title;
        MessageDlg(''+#13+#10+'Reporte sin datos.         ', mtWarning, [mbOK], 0);
        ForcePrint:=False;
        Close;
        Exit;
      end;

      //Numero de paginas
      spePaginas.MinValue:=1;
      spePaginas.MaxValue:=QRPreview.QRPrinter.PageCount;
      spePaginas.Value:=1;
      ActualizaBotones;

      //Inicialmente zoom a lo ancho.
      QRPreview.ZoomToFit ;
      toFit:=QRPreview.Zoom;
      QRPreview.ZoomToWidth ;
      toWidth:=QRPreview.Zoom;
      ActualizaBtnZoom;

      //Informacion sobre la impresora
      ActualizaImpresora;

      //Habilitamos botones
      for i:=0 to Botonera.ControlCount-1 do
      begin
        Botonera.Controls[i].Enabled:=True;
      end;
    end;
  end;
end;

procedure TDPreview.QRPreviewProgressUpdate(Sender: TObject;
  Progress: Integer);
begin
  prbProgreso.Position:= Progress;
  if (Progress = 0) or (Progress = 100) then begin
   prbProgreso.Position := 0;
   prbProgreso.Visible:=False;
  end else
   prbProgreso.Visible:=True;
end;
//*************************************************************************
//FIN EVENTOS DEL PREVIEW
//*************************************************************************

//*************************************************************************
//MANEJADOR DE ACCIONES
//*************************************************************************
procedure TDPreview.AccionExecute(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    0:Imprimir;
    1:Configurar;
    2:IrPrimeraHoja;
    3:IrHojaAnterior;
    4:IrHojaSiguiente;
    5:IrUltimaHoja;
    6:ZoomAmpliar;
    7:ZoomDisminuir;
    8:ZoomOriginal;
    9:ZoomAncho;
    10:ZoomAlto;
    11:Guardar;
    12:Abrir;
    13:Close;
    14:DesplazarArriba;
    15:DesplazarAbajo;
    16:DesplazarIzquierda;
    17:DesplazarDerecha;
    18:CorreoElectronico;
  end;
end;
//*************************************************************************
//FIN MANEJADOR DE ACCIONES
//*************************************************************************

//*************************************************************************
//NAVEGACION POR LAS HOJAS
//*************************************************************************
procedure TDPreview.IrPrimeraHoja;
begin
 Application.ProcessMessages;
 spePaginas.Value:=1;
 ActualizaBotones;
end;

procedure TDPreview.IrUltimaHoja;
begin
 Application.ProcessMessages;
 spePaginas.Value:=QRPreview.QRPrinter.PageCount;
 ActualizaBotones;
end;

procedure TDPreview.IrHojaAnterior;
begin
 Application.ProcessMessages;
 if QRPreview.PageNumber > 1 then
   spePaginas.Value:= QRPreview.PageNumber - 1;
 ActualizaBotones;
end;

procedure TDPreview.IrHojaSiguiente;
begin
 Application.ProcessMessages;
 if QRPreview.PageNumber < QRPreview.QRPrinter.PageCount then
   spePaginas.Value:= QRPreview.PageNumber + 1;
 ActualizaBotones;
end;

procedure TDPreview.ActualizaBotones;
begin
  stbEstado.Panels[0].Text := sStatus;
  APrimera.Enabled:=spePaginas.Value>1;
  AAnterior.Enabled:=spePaginas.Value>1;
  ASiguiente.Enabled:=spePaginas.Value<QRPreview.QRPrinter.PageCount;
  AUltima.Enabled:=spePaginas.Value<QRPreview.QRPrinter.PageCount;
end;

procedure TDPreview.spePaginasChange(Sender: TObject);
begin
  With spePaginas do
  begin
    if length(Text)<1 then Value:=MinValue;
    if Value> MaxValue then Value:=MaxValue;
    if Value< MinValue then Value:=MinValue;
  end;
  VerPagina;
end;

procedure TDPreview.VerPagina;
begin
  Application.ProcessMessages;
  Caption:=Title+' - Pagina '+IntToStr(spePaginas.Value)+
                      ' de '+IntToStr(QRPreview.QRPrinter.PageCount);
  QRPreview.PageNumber := spePaginas.Value;
end;

procedure TDPreview.DesplazarAbajo;
begin
  With QRPreview.VertScrollBar do
    Position := Position + trunc(Range / 10);
end;

procedure TDPreview.DesplazarArriba;
begin
  With QRPreview.VertScrollBar do
    Position := Position - trunc(Range / 10);
end;

procedure TDPreview.DesplazarIzquierda;
begin
  With QRPreview.HorzScrollBar do
    Position := Position - trunc(Range / 10);
end;

procedure TDPreview.DesplazarDerecha;
begin
  With QRPreview.HorzScrollBar do
    Position := Position + trunc(Range / 10);
end;

procedure TDPreview.AJumpExecute(Sender: TObject);
var
  aux:String;
  valor:Integer;
begin
  aux:=IntToStr(spePaginas.Value);
  if InputQuery('IR A LA PÁGINA ...','Introduce num. de página: ',aux) then begin
    try
      valor:=StrToInt(aux);
    except
      MessageDlg(''+#13+#10+'Valor no válido.           ', mtWarning, [mbOK], 0);
      Exit;
    end;
    spePaginas.Value:=Valor;
  end;
end;

//*************************************************************************
//FIN NAVEGACION POR LAS HOJAS
//*************************************************************************


//*************************************************************************
//ZOOM PAGINA
//*************************************************************************
procedure TDPreview.ZoomAmpliar;
begin
  Application.ProcessMessages;
  QRPreview.Zoom := QRPreview.Zoom + 10;
  ActualizaBtnZoom;
end;

procedure TDPreview.ZoomDisminuir;
begin
  Application.ProcessMessages;
  QRPreview.Zoom := QRPreview.Zoom - 10;
  ActualizaBtnZoom;
end;

procedure TDPreview.ZoomOriginal;
begin
  Application.ProcessMessages;
  QRPreview.Zoom := 100;
  ActualizaBtnZoom;
end;

procedure TDPreview.ZoomAncho;
begin
  Application.ProcessMessages;
  QRPreview.ZoomToWidth;
  ActualizaBtnZoom;
end;

procedure TDPreview.ZoomAlto;
begin
  Application.ProcessMessages;
  QRPreview.ZoomToFit;
  ActualizaBtnZoom;
end;

procedure TDPreview.ActualizaBtnZoom;
begin
  AAumentar.Enabled:=QRPreview.Zoom<200;
  ADisminuir.Enabled:=QRPreview.Zoom>45;
  //AOriginal.Enabled:=QRPreview.Zoom<>100;
  //AAncho.Enabled:=QRPreview.Zoom<>toWidth;
  AAlto.Enabled:=QRPreview.Zoom>toFit;
  stbEstado.Panels[1].Text:=Format('Zoom = %d %',[QRPreview.Zoom]);
end;
//*************************************************************************
//FIN ZOOM PAGINA
//*************************************************************************

//*************************************************************************
//IMPRIMIR LISTADO
//*************************************************************************
procedure TDPreview.Imprimir;
var
  i:Integer;
begin
  AImprimir.Enabled:=False;
  AConfigurar.Enabled:=False;

  //La propiedad master del objeto QRPrinter es el report
  if (QRPreview.QRPrinter.Master = nil) then
  begin
       //El report ha sido cargado
       for i:=0 to Copias-1 do
            QRPreview.QRPrinter.Print;
  end
  else if (TCustomQuickRep(QRPreview.QRPrinter.Master).QRPrinter.status = mpFinished) then
       begin
            //El report ha sido generado
            TQuickRep(QRPreview.QRPrinter.Master).PrinterSettings.Copies:=Copias;
            if TQuickRep(QRPreview.QRPrinter.Master).PrinterSettings.Copies = Copias then
               TQuickRep(QRPreview.QRPrinter.Master).Print
            else
            begin
                 for i:=0 to Copias-1 do
                    TQuickRep(QRPreview.QRPrinter.Master).Print;
            end;//if
       end
       else
           MessageDlg(''+#13+#10+'Detectados problemas.'+#13+#10+'Por favor, intentelo de nuevo y si no funciona         '+#13+#10+'reinicie el programa y/o ordenador.', mtWarning, [mbOK], 0);

  AImprimir.Enabled:=True;
  AConfigurar.Enabled:=True;
  //Close;
end;
//*************************************************************************
//FIN IMPRIMIR LISTADO
//*************************************************************************


//*************************************************************************
//CONFIGURAR LISTADO
//*************************************************************************
procedure TDPreview.Configurar;
var
  iDesde,iHasta:Integer;
begin
  {Seleccionar impresora y configurar}
  with TDConfigPrinter.Create(Application) do begin
    if qrprinter.master<>nil then begin
      if Execute(TQuickRep(QRPreview.qrprinter.master).PrinterSettings.PrinterIndex,
              QRPreview.QRPrinter.PageCount,Copias,True) then begin
        //Impresora
        TQuickRep(QRPreview.qrprinter.master).PrinterSettings.PrinterIndex:=
          cbImpresoras.ItemIndex;
        //Copias
        Copias:=StrToInt(NumeroCopias.Text);
        //Rango de impresion
        if RadioButton1.Checked then
        begin
          //Imprimir todas los hojas
          TQuickRep(QRPreview.qrprinter.master).PrinterSettings.FirstPage:=1;
          TQuickRep(QRPreview.qrprinter.master).PrinterSettings.LastPage:=TQuickRep(QRPreview.qrprinter.master).PageNumber;
        end else
        if RadioButton2.Checked then
        begin
          //Rando de impresion
          if Trim(Desde.Text)='' then
            iDesde:=1
          else begin
            iDesde:=StrToInt(Desde.Text);
            if iDesde<1 then iDesde:=1;
          end;

          if Trim(Hasta.Text)='' then
            iHasta:=TQuickRep(QRPreview.qrprinter.master).PageNumber
          else begin
            iHasta:=StrToInt(Hasta.Text);
            if iHasta>TQuickRep(QRPreview.qrprinter.master).PageNumber then
               iHasta:=TQuickRep(QRPreview.qrprinter.master).PageNumber;
          end;

          if iDesde>iHasta then iDesde:=iHasta;

          TQuickRep(QRPreview.qrprinter.master).PrinterSettings.FirstPage:=iDesde;
          TQuickRep(QRPreview.qrprinter.master).PrinterSettings.LastPage:=iHasta;
        end;
        AImprimir.Execute;
      end;//if
    end else begin
      if Execute(QRPreview.qrprinter.PrinterIndex,
              QRPreview.QRPrinter.PageCount,Copias,False) then begin
        //Impresora
        QRPreview.qrprinter.PrinterIndex:=cbImpresoras.ItemIndex;
        //Copias
        Copias:=StrToInt(NumeroCopias.Text);
        //Imprimir
        AImprimir.Execute;
      end;//if
    end;//if
    Free;
  end;//with
end;

procedure TDPreview.ActualizaImpresora;
var
  aux:string;
begin
  if Copias>1 then aux:='copias'
  else aux:='copia';
  if TQuickRep(qrprinter.master)<>nil then begin
    if TQuickRep(qrprinter.master).PrinterSettings.PrinterIndex=-1 then
      stbEstado.Panels[2].Text:=' Imprimir '+IntToStr(Copias)+' '+aux+' en '+
         Printer.Printers[Printer.PrinterIndex]
    else
      stbEstado.Panels[2].Text:=' Imprimir '+IntToStr(Copias)+' '+aux+' en '+
         Printer.Printers[TQuickRep(qrprinter.master).PrinterSettings.PrinterIndex]
  end else begin
    stbEstado.Panels[2].Text:=' Imprimir '+IntToStr(Copias)+' '+aux+' en '+
       Printer.Printers[QRPrinter.PrinterIndex];
  end;//if
end;
//*************************************************************************
//FIN CONFIGURAR LISTADO
//*************************************************************************



function TDPreview.TransformarNombre(AFileName: string; AExt: string): String;
var
  Ext: string;
  FileName: string;
begin
  Ext := ExtractFileExt(AFileName);
  FileName := MidStr(AFileName, 1, Pos(Ext, AFileName)-1);
  Result := Format('%s.%s', [ FileName, LowerCase(AExt)])
end;



//*************************************************************************
//GUARDAR CARGAR LISTADOS
//*************************************************************************
procedure TDPreview.Guardar;

var
  //aPDFFilt : TQRPDFDocumentFilter;
  sAux: string;

begin
  with TSaveDialog.Create(Application) do
  try
    Title := '  Guardar informe/listado.';
    Filter := 'Documento EXCEL (*.xls)|*.xls|' +
      'Documento PDF (*.pdf)|*.pdf|' +
      'Microsoft Word (*.doc)|*.doc';
              //'Comma Separed File (*.csv)|*.csv';

    sAux:= StringReplace(TQuickRep(qrprinter.master).ReportTitle, ' ', '_', [rfReplaceAll] );
    sAux:= StringReplace(sAux, 'ñ', 'n', [rfReplaceAll,rfIgnoreCase] );
    sAux:= StringReplace(sAux, 'á', 'a', [rfReplaceAll,rfIgnoreCase] );
    sAux:= StringReplace(sAux, 'é', 'e', [rfReplaceAll,rfIgnoreCase] );
    sAux:= StringReplace(sAux, 'í', 'i', [rfReplaceAll,rfIgnoreCase] );
    sAux:= StringReplace(sAux, 'ó', 'o', [rfReplaceAll,rfIgnoreCase] );
    sAux:= StringReplace(sAux, 'ú', 'u', [rfReplaceAll,rfIgnoreCase] );
    FileName:= sAux;

    if Execute then
    begin
      case FilterIndex of
        1: {XLS}
            FileName := TransformarNombre(FileName, 'xls');
        2: {PDF}
            FileName := TransformarNombre(FileName, 'pdf');
        3: {DOC}
            FileName := TransformarNombre(FileName, 'doc');
      end;

      if FileExists(FileName) then
        if MessageDlg(''+#13+#10+'El fichero seleccionado ya existe, si continua'+#13+#10+'se sobrescribira el fichero existente.              '+#13+#10+'¿Desea sobreescribir?',
                      mtWarning, [mbYes, mbCancel], 0) = mrCancel then
          Exit;

      case FilterIndex of
        1: {XLS}
            TQuickRep(qrprinter.master).ExportToFilter(TQRXLSFilter.Create(Filename));

        2: {PDF}
          begin
            //ExportQR.ExportQRPDF(FileName, true, true);
            TQuickRep(qrprinter.master).ExportToFilter(TQRPDFDocumentFilter.Create( Filename ) );
            (*
            //aPDFFilt := TQRPDFDocumentFilter.Create('c:\temp\bancos.pdf');
            if (uppercase(ExtractFileExt(FileName)) <> 'PDF') then
              FileName := FileName + '.pdf';
            TQuickRep(qrprinter.master).ExportToFilter(TQRPDFDocumentFilter.Create(Filename));
            //QRLBancos.ExportToFilter( aPDFFilt );
            //aPDFFilt.free;
            *)
          end;
        3: {DOC}
            TQuickRep(qrprinter.master).ExportToFilter(TQRRTFExportFilter.Create(Filename));
      end;

      //Ejecutar el programa adecuado segun el formato en el que se haya guardado
      {ShellExecute(Application.Handle,
                 'open',
                 PChar(Filename),
                 nil,
                 PChar(extractfilepath(FileName)),
                 SW_SHOWNORMAL);}
    end;
  finally
    Free;
  end;
end;

procedure TDPreview.Guardar_old;
{
var
  guardar:Boolean;
  rtfFilter:TPsQRRTFFilter;
  pdfFilter:TPsQRPDFFilter;
  jpgFilter:TPsQRJPEGFilter;
  txtFilter:TQRAsciiExportFilter;
  csvFilter:TQRCommaSeparatedFilter;
  xlsFilter:TQRXLSFilter;
}
begin
  //LISTA EL NOMBRE DE TODOS LOS FILTROS
  (*for i:=0 to QRExportFilterLibrary.Filters.Count do
    ShowMessage(TQRExportFilterLibraryEntry(QRExportFilterLibrary.Filters[i]).ExportFilterClass.ClassName);
  Exit;*)

 {
  with TSaveDialog.Create(Application) do begin
    Title:='Guardar listado/informe.';
    Filter:='(*.QRP) Archivo QuickReport|*.QRP'+
            '|(*.TXT) Fichero de Texto|*.TXT'+
            '|(*.CSV) Texto Delimitado por Comas|*.CSV'+
            '|(*.DOC) Documento Word|*.DOC'+
            '|(*.PDF) Documento PDF|*.PDF'+
            '|(*.JPG) Imagen JPEG|*.JPG' +
            '|(*.XLS) Documento Excel|*.XLS';
    if Execute then begin
      guardar:=True;

      if FileExists(FileName) then begin
        if MessageDlg(''+#13+#10+'El fichero seleccionado ya existe, si continua'+#13+#10+'se sobrescribira el fichero existente.              '+#13+#10+'¿Desea continuar?',
                      mtWarning, [mbYes, mbNo], 0)=mrNo then guardar:=False;
      end;

      try
        if guardar then begin
          case FilterIndex of
            1://QRP
            begin
              if UpperCase(ExtractFileExt(FileName))='.QRP' then
                QRPrinter.Save(FileName)
              else
                QRPrinter.Save(FileName+'.qrp');
            end;
            2://TXT
            begin
              if UpperCase(ExtractFileExt(FileName))<>'.TXT' then
                FileName:=FileName+'.txt';

              txtFilter:=TQRAsciiExportFilter.Create(Filename);
              try
                QRPrinter.ExportToFilter(txtFilter)
              finally
                txtFilter.Free;
              end;
            end;
            3://CSV
            begin
              if UpperCase(ExtractFileExt(FileName))<>'.CSV' then
                FileName:=FileName+'.csv';

              csvFilter:=TQRCommaSeparatedFilter.Create(Filename);
              try
                QRPrinter.ExportToFilter(csvFilter)
              finally
                csvFilter.Free;
              end;
            end;
            4://DOC
            begin
              if UpperCase(ExtractFileExt(FileName))<>'.DOC' then
                FileName:=FileName+'.doc';
              rtfFilter:=TPsQRRTFFilter.Create(FileName);
              try
                QRPrinter.ExportToFilter(rtfFilter)
              finally
                rtfFilter.Free;
              end;
            end;
            5://PDF
            begin
              if UpperCase(ExtractFileExt(FileName))<>'.PDF' then
                FileName:=FileName+'.pdf';
              pdfFilter:=TPsQRPDFFilter.Create(FileName);
              try
                QRPrinter.ExportToFilter(pdfFilter)
              finally
                pdfFilter.Free;
              end;
            end;
            6://JPG
            begin
              if (UpperCase(ExtractFileExt(FileName))<>'.JPG') and
                 (UpperCase(ExtractFileExt(FileName))<>'.JPEG') then
                FileName:=FileName+'.jpg';
              jpgFilter:=TPsQRJPEGFilter.Create(FileName);
              try
                QRPrinter.ExportToFilter(jpgFilter)
              finally
                jpgFilter.Free;
              end;
            end;
            7://XLS
            //TQuickRep(qrprinter.master).ExportToFilter(TQRXLSFilter.Create(Filename));
            begin
              if UpperCase(ExtractFileExt(FileName))<>'.XLS' then
                FileName:=FileName+'.xls';
              xlsFilter:=TQRXLSFilter.Create(FileName);
              try
                QRPrinter.ExportToFilter(xlsFilter)
              finally
                xlsFilter.Free;
              end;
            end;
          end;
        end;
      except
        MessageDlg(''+#13+#10+'Problemas al guardar el listado/informe.        ', mtError, [mbYes], 0);
      end;
    end;
    Free;
  end;
 }
end;

procedure TDPreview.Abrir;
var
  cargar:Boolean;
begin
  with TOpenDialog.Create(Application) do begin
    Title:='Cargar listado/informe.';
    Filter:='QuickReport file (*.QRP)|*.QRP';
    if Execute then begin
      cargar:=True;

      if not FileExists(FileName) then begin
        MessageDlg(''+#13+#10+'El fichero seleccionado no existe.         ', mtWarning, [mbOK], 0);
        cargar:=False;
      end;

      try
        if cargar then begin
          QRPrinter.Master:=nil;

          if UpperCase(ExtractFileExt(FileName))='.QRP' then
            QRPrinter.Load(FileName)
          else
            QRPrinter.Load(FileName+'.QRP');

          QRPreview.PageNumber := 1;
          QRPreview.PreviewImage.PageNumber := 1;
          spePaginas.MaxValue:=QRPrinter.PageCount;
          Caption:=Title+' - Pagina 1 de '+IntToStr(QRPrinter.PageCount);
          Caption := 'Viendo reporte salvado - ' + FileName;

          spePaginas.Value:=1;
          ActualizaBotones;
          ActualizaImpresora;

          ASalvar.Enabled:=False;
          ACorreo.Enabled:=False;
        end;
      except
        MessageDlg(''+#13+#10+'Problemas al abrir el listado/informe.        ', mtError, [mbYes], 0);
      end;
    end;
    Free;
  end;
end;

procedure TDPreview.PreviewFile(FileName:string);
begin
  try
    {QRPrinter.Master:=nil;
    QRPrinter.Load(FileName);}

    QRPreview.PageNumber := 1;
    QRPreview.PreviewImage.PageNumber := 1;
    spePaginas.MaxValue:=QRPrinter.PageCount;
    Caption:=Title+' - Pagina 1 de '+IntToStr(QRPrinter.PageCount);
    Caption := 'Viendo reporte salvado - ' + FileName;

    spePaginas.Value:=1;
    ActualizaBotones;
    ActualizaImpresora;

    Show;

    ASalvar.Enabled:=False;
    ACorreo.Enabled:=False;
  except
    MessageDlg(''+#13+#10+'Problemas al abrir el listado/informe.        ', mtError, [mbYes], 0);
  end;
end;

//*************************************************************************
//FIN GUARDAR CARGAR LISTADOS
//*************************************************************************
procedure TDPreview.CorreoElectronico;
Var
   Adjunto: TIdAttachmentFile;
   Email, Smtp, Password, Usuario, Ruta, DireccionEnvio: String;
   PuertoSmtp: Integer;
   Fichero: TFileName;
   RutaCompleta: TFileName;
begin
     try
        PanelMsg.Visible:=True;
        Screen.Cursor:=crHourGlass;

        Application.ProcessMessages;

        Ruta := GetCurrentDir() + '\Correo\';
{
        if qrprinter.master).ReportTitle = '' then
        begin
          Fichero := FormatDate('yymmdd
        end;
}
        Fichero := StringReplace(TQuickRep(qrprinter.master).ReportTitle, ' ', '_', [rfReplaceAll] );
        Fichero := TransformarNombre(Fichero, 'pdf');

        RutaCompleta := Format('%s%s', [ Ruta, Fichero ]);

        //Crear documento PDF
        try
          TQuickRep(qrprinter.master).ExportToFilter(TQRPDFDocumentFilter.Create( RutaCompleta ) );
        except
          on E: Exception do
                if Pos('File could', E.Message) > 0 then
                   MessageDlg('No ha podido crearse el fichero .pdf', mtError,[mbOK],0);
        end;
        //DeleteFile(PChar(Ruta + 'Ri.qrt'));

        if ConfiguracionCorreo(EmpresaGlobal, Email, Smtp, Usuario, Password, PuertoSmtp) then
        begin
             //Conexion Correo SMTP (Configuracion de nuestra cuenta de correo)
             IdSMTP1.Host:=Smtp;              //SMTP
             IdSMTP1.Port:=PuertoSmtp;        //Puerto SMTP
             IdSMTP1.Password:=Password;      //Contraseña
             IdSMTP1.Username:=Usuario;         //Nombre Usuario
//             IdSMTP1.AuthType:=atLogin;

             //Mensaje
             DireccionEnvio:=CorreoCliente(EmpresaGlobal, ClienteGlobal);
             if DireccionEnvio<>'' then
             begin
                  IdMessage1.Body.Text:='';                                //Cuerpo del correo
                  IdMessage1.From.Text:=Email;                             //Nuestra Direccion de Correo
                  IdMessage1.Recipients.EMailAddresses:=DireccionEnvio;    //Direccion de envio
                  IdMessage1.Subject:='Albaran/Factura';

                  //Documento Adjunto
                  Adjunto:=TIdAttachmentFile.Create(IdMessage1.MessageParts, Ruta + 'Ri.pdf');
                  IdsMTP1.Connect;
                  try
                     IdsMTP1.Send(IdMessage1);
                  finally
                         IdsMTP1.Disconnect;
                         FreeAndNil(Adjunto);
                  end;
                  Screen.Cursor:=crDefault;
                  PanelMsg.Visible:=False;

                  MessageDlg('Correo Enviado', mtInformation,[mbOK],0);
             end
             else
                 MessageDlg('No encontrada la dirección de correo del cliente', mtInformation,[mbOK],0);
        end
        else
            MessageDlg('No encontrada la configuración del correo electrónico de la empresa', mtInformation,[mbOK],0);
     except
          On E:Exception do
               MessageDlg('Error al enviar el correo', mtError,[mbOK],0);
     end;
     PanelMsg.Visible:=False;
     Screen.Cursor:=crDefault;
end;

procedure TDPreview.CorreoElectronico_old;
Var
   Adjunto: TIdAttachmentFile;
   Email, Smtp, Password, Usuario, Ruta, DireccionEnvio: String;
   PuertoSmtp: Integer;
   INI: TIniFile;
begin
     try
        PanelMsg.Visible:=True;
        Screen.Cursor:=crHourGlass;

        Application.ProcessMessages;

        Ruta:=GetCurrentDir() + '\Correo\';

{
        //Crear documento PDF
        QRPreview.QRPrinter.Save(Ruta +  'Ri.qrt');
        try
           IgtDocumentEngine(gtQRExportInterface1.Engine).FileName:=Ruta + 'Ri.pdf';
           gtQRExportInterface1.RenderDocument(Ruta + 'Ri.qrt');
        except
              on E: Exception do
                    if Pos('File could', E.Message) > 0 then
                       MessageDlg('No ha podido crearse el fichero .pdf', mtError,[mbOK],0);
        end;
        DeleteFile(PChar(Ruta + 'Ri.qrt'));
}
        //Otra Forma de Crear el PDF
        {
        with TPsQRPDFFilter.Create('c:\tmp\ri.pdf');
        try
           QRPrinter.ExportToFilter(pdfFilter)
        finally
              Free;
        end;
        }

        if ConfiguracionCorreo(EmpresaGlobal, Email, Smtp, Usuario, Password, PuertoSmtp) then
        begin
             //Conexion Correo SMTP (Configuracion de nuestra cuenta de correo)
             IdSMTP1.Host:=Smtp;              //SMTP
             IdSMTP1.Port:=PuertoSmtp;        //Puerto SMTP
             IdSMTP1.Password:=Password;      //Contraseña
             IdSMTP1.Username:=Usuario;         //Nombre Usuario
//             IdSMTP1.AuthType:=atLogin;

             //Mensaje
             DireccionEnvio:=CorreoCliente(EmpresaGlobal, ClienteGlobal);
             if DireccionEnvio<>'' then
             begin
                  IdMessage1.Body.Text:='';                                //Cuerpo del correo
                  IdMessage1.From.Text:=Email;                             //Nuestra Direccion de Correo
                  IdMessage1.Recipients.EMailAddresses:=DireccionEnvio;    //Direccion de envio
                  IdMessage1.Subject:='Albaran/Factura';

                  //Documento Adjunto
                  Adjunto:=TIdAttachmentFile.Create(IdMessage1.MessageParts, Ruta + 'Ri.pdf');
                  IdsMTP1.Connect;
                  try
                     IdsMTP1.Send(IdMessage1);
                  finally
                         IdsMTP1.Disconnect;
                         FreeAndNil(Adjunto);
                  end;
                  Screen.Cursor:=crDefault;
                  PanelMsg.Visible:=False;

                  MessageDlg('Correo Enviado', mtInformation,[mbOK],0);
             end
             else
                 MessageDlg('No encontrada la dirección de correo del cliente', mtInformation,[mbOK],0);
        end
        else
            MessageDlg('No encontrada la configuración del correo electrónico de la empresa', mtInformation,[mbOK],0);
     except
          On E:Exception do
               MessageDlg('Error al enviar el correo', mtError,[mbOK],0);
     end;
     PanelMsg.Visible:=False;
     Screen.Cursor:=crDefault;
     DeleteFile(PChar(Ruta + 'Ri.pdf'));
end;

procedure TDPreview.spCopiasChange(Sender: TObject);
begin
     Copias:=spCopias.Value;
end;

initialization
    PorDefecto:=True;
    ForcePrint:=False;
    DistinctCopys:=False;
    Copias:=1;
end.

