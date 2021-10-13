unit UGLobal;

interface


uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Math, Variants, XMLDoc, XMLIntf, DBTables, WinSvc;

procedure BorrarDirectorio(Directorio: String);
procedure CopiaSeguridad();
procedure MostrarModal(Objeto: TFormClass); //Crea y muestra una ventana modal
Procedure Mostrar(Objeto: TFormClass);
Procedure CapturaErrores(E: Exception);     //Muestra el mensaje de error de una excepcion
function  RellenarCeros(Cadena:String;Longitud:Integer;Sentido:Char):String;   //Rellena con ceros una cadena por la Izq. o Dcha.
function  RellenarBlancos(Cadena:String;Longitud:Integer;Sentido:Char):String; //Rellena con blancos una cadena por la Izq. o Dcha.
function  EsNumerico(Cadena:String):Boolean ;
function  EsDecimal(Cadena:String):Boolean;
function  Redondear(valor:real;decimales:integer):real;overload; //Redondea un numero de decimales
function  Redondear(valor:real):integer;overload;     //Redondea al entero mas proximo
function  ParteEntera(Numero: Real):Integer;          //Parte entera
function  ParteDecimal(Numero: Real):String;          //Parte decimal
function  ValorFloat(Numero: String):Real;            //Transforma un Text a Real pero evitando el fallo de StrToFloat con cadenas vacias
function  EsFecha(Cadena:String):Boolean;overload;
function  EsFecha(Fecha: TDateTime):Boolean;overload;
function  AnyoMesDia(Fecha: String):String;overload;
function  AnyoMesDia(Fecha: TDateTime):String;overload;
function  DiaMesAnyo(Fecha: String):String;
function  Year(Fecha: TDateTime):Word;                //Año de una Fecha
function  Month(Fecha: TDateTime):Word;               //Mes de una Fecha
function  Day(Fecha: TDateTime):Word;                 //Dia de una Fecha
function  Provincia(Origen, CodigoPostal:String):String;
function  NomTipoUsuario(Usuario: String):String;
function  NomEmpresa(Empresa: String):String;
function  NomFamilia(Empresa, Familia: String):String;
function  NomArticulo(Empresa, Familia, Articulo: String): String;
function  NomArticuloUnidadFamilia(Empresa, Articulo: String; Var Familia: String): String;
function  NomCliente(Empresa, Cliente: String):String;
procedure NomAutorizadosCliente(Var Autorizado1, Autorizado2: String; Empresa, Cliente: String );
function  NomUnidad(Empresa, Unidad: String):String;
function  NomUnidadAbreviada(Empresa, Familia, Articulo: String):String;
function  NomOrigen(Codigo: String):String;
function  NomTipoEntrada(Tipo: String):String;
function  NomTipoLote(Tipo: String):String;
function  NomTipoCobro(Tipo: String):String;
function  NomConcepto(Empresa, Concepto: String):String;
function  ExisteArticulo(Empresa, Familia, Articulo: String): Boolean;overload;
function  ExisteArticulo(Empresa, Articulo: String): Boolean;overload;
function  ConfiguracionCorreo(Empresa: String; Var Email, Smtp, Usuario, Password: String; Var PuertoSmtp: Integer):Boolean;
function  CorreoCliente(Empresa, Cliente: String): String;
function  LeerFamilia(Empresa,Articulo:String):String;
function  LupaEmpresas():String;
function  LupaCLientes(Empresa:String):String;
function  LupaTarifas(Empresa:String):String;
function  LupaFacturas(Empresa, Cliente: String; Var Fecha:String):String;
function  LupaArticulos(Empresa: String; Var Familia: String):String;
function  LupaFamiliaArticulos(Empresa: String; Var Familia: String):String;
function  LupaFamilias(Empresa: String):String;
function  LupaUnidades(Empresa: String):String;
//function  LupaLotes(Empresa, Cliente: String):String; overload;
function  LupaLotes(Empresa, Cliente, Lote, LoteOrigen: String):String; overload;
function  LupaLotesOrigen(Empresa, Cliente, Lote, LoteOrigen: String):String; overload;
function  LupaConceptos(Empresa: String):String;
procedure ImprimirFacturacion(Definitiva: Boolean; NumFacturaDesde, NumFacturaHasta: Integer; Empresa, ClienteDesde, ClienteHasta: String; FechaFactura: TDateTime);


function  FindWindow(lpClassName, lpWindowName: PChar): HWND; stdcall;  //Funcion del Api

Var
   EmpresaGlobal, ClienteGlobal: String;

   //------------- VARIABLES GLOBALES PARA EL CONTROL DE USUARIOS -----------------
   UsuarioGlobal, TipoUsuarioGlobal: String;

implementation

uses MBaseDatos, BEmpresas, BClientes, BTarifas, BFacturas, BArticulos, BFamilias, BUnidadesMedida, BLotes, BConceptos, LFactura;

function FindWindow; external 'user32.dll' name 'FindWindowA';  //Funcion del Api

//---------------------- BORRA UN DIRECTORIO -----------------------------------
procedure BorrarDirectorio(Directorio: String);
var
   search: TSearchRec;
   nFiles: integer;
begin
     nFiles:=FindFirst(Directorio + '\*.*', faAnyFile,  search );
     while nFiles=0 do
     begin
          if Search.Attr = faDirectory then
          begin
               if (Search.Name<>'.') and (Search.Name<>'..') then
                  BorrarDirectorio(Directorio + '\' + Search.Name);
          end
          else
              DeleteFile(Directorio + '\' + Search.Name);
          nFiles:=FindNext( Search );
     end;
     FindClose(Search);
     RMDir(Directorio);
end;

//------------ REALIZA LA COPIA DE SEGURIDAD DE LA BASE DE DATOS ---------------
procedure CopiaSeguridad();
Var
   QAux: TQuery;
   Ruta, Fecha, Hora: String;
   Fichero: file of Byte;
begin
     try
        Fecha:=StringReplace(DateToStr(Date()), '/', '_',[rfReplaceAll]);
        Hora:=StringReplace(TimeToStr(Now()), ':', '_',[rfReplaceAll]);
        Ruta:=ExtractFilePath(Application.ExeName) + 'CopiasSeguridad\Frigo' + '-' + Fecha + '-' + Hora;
        if MessageBox(Application.Handle, PChar('La copia de seguridad se realizará en: ' +
                      chr(13) + Ruta + chr(13) + '¿Desea Continuar?'),
                      PChar('COPIA DE SEGURIDAD'),
                      MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1)=IDYES then
        begin
             QAux:=TQuery.Create(Application);
             try
                with QAux do
                begin
                     DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                     QAux.SQL.Add('BACKUP DATABASE [Frigo] TO  DISK = N' +
                                  QuotedStr(Ruta) +
                                  'WITH NOFORMAT, NOINIT,  NAME = N' +
                                  QuotedStr('Frigo-Copia de seguridad') +
                                  ', SKIP, NOREWIND, NOUNLOAD,  STATS = 10');
                     QAux.ExecSQL;

                     AssignFile(Fichero, Ruta);
                     Reset(Fichero);
                     try
                        if FileSize(Fichero)<>0 then
                           MessageDlg (Chr(13) + 'Copia realizada con exito', mtInformation,[mbOk],0)
                        else
                            MessageDlg (Chr(13) + 'Error al realizar la copia de seguridad', mtError,[mbOk],0);
                     finally
                            CloseFile(Fichero);
                     end;
                end;
             finally
                    QAux.Close;
                    FreeAndNil(QAux);
             end;
        end;
     except
           On E: Exception do
                 MessageDlg (Chr(13) + 'Error al realizar la copia de seguridad', mtError,[mbOk],0);
     end;
end;

//---------- CREA UN FORMULARIO Y LO MOSTRARMOS EN MODO MODAL ------------------
Procedure MostrarModal(Objeto: TFormClass);
begin
     try
        with Objeto.Create(Application) do
        try
           ShowModal;
        finally
               Free;
        end;
     except
           On E: Exception do
                 MessageDlg (Chr(13) + E.Message, mtError,[mbOk],0);
     end;
end;

//---------- CREA UN FORMULARIO ------------------------------------------------
Procedure Mostrar(Objeto: TFormClass);
begin
     try
        with Objeto.Create(Application) do
        try
           Show;
        finally
               Free;
        end;
     except
           On E: Exception do
                 MessageDlg (Chr(13) + E.Message, mtError,[mbOk],0);
     end;
end;

//----------------------- MUESTRA EL ERROR DE UNA EXCEPCION --------------------
Procedure CapturaErrores(E: Exception);
begin
     if E is EDBEngineError then
     begin
          if EDBEngineError(E).Errors[0].ErrorCode=9734 then
             ShowMessage('Imposible borrar: existen registros relacionados')
          else
              MessageDlg (Chr(13) + E.Message, mtError,[mbOk],0);
     end
     else
         MessageDlg (Chr(13) + E.Message, mtError,[mbOk],0);
end;

//FUNCIÓN PARA RELLENAR CON CEROS(POR LA IZQ. O POR LA DCHA.) UNA CADENA
function RellenarCeros(Cadena:String;Longitud:Integer;Sentido:Char):String;
Var
   CadenaCeros: String;
begin
     CadenaCeros:='';
     SetLength(CadenaCeros,Longitud-Length(Cadena));
     FillChar(CadenaCeros[1],Longitud-Length(Cadena),'0');
     if Sentido='I' then //Por la Izquierda
          Result:=CadenaCeros + Cadena
     else  //Por la Derecha
        Result:=Cadena + CadenaCeros;
end;

//FUNCIÓN PARA RELLENAR CON BLANCOS(POR LA IZQ. O POR LA DCHA.) UNA CADENA
function RellenarBlancos(Cadena:String;Longitud:Integer;Sentido:Char):String;
Var
   CadenaBlancos: String;
begin
     CadenaBlancos:='';
     SetLength(CadenaBlancos,Longitud-Length(Cadena));
     FillChar(CadenaBlancos[1],Longitud-Length(Cadena),' ');
     if Sentido='I' then //Por la Izquierda
        Result:=CadenaBlancos + Cadena
     else  //Por la Derecha
        Result:=Cadena + CadenaBlancos;

     if Length(Result)>Longitud then
        Result:=copy(Result,1,Longitud);
end;

//FUNCIÓN QUE COMPRUEBA SI UNA CADENA ES NUMÉRICA
function EsNumerico(Cadena:String):Boolean;
begin
     try
        if Cadena='' then
           Result:=False
        else if not ((Copy(Cadena,1,1)>='0') and (Copy(Cadena,1,1)<='9')) then
                Result:=False
             else
             begin
                  Cadena:=StringReplace(Cadena, '.', '',[rfReplaceAll]);
                  StrToInt64(Cadena);
                  Result:=True;
             end;
     except  //Al hacer la conversión se produce un error
          on E: Exception do
                Result:=False;
     end;
end;

//FUNCIÓN QUE COMPRUEBA SI UNA CADENA ES NUMÉRICA
function EsDecimal(Cadena:String):Boolean;
begin
     try
        if Cadena='' then
          Result:=False
        else if (not ((Copy(Cadena,1,1)>='0') and (Copy(Cadena,1,1)<='9'))) and (Copy(Cadena,1,1)<>'-') then
                Result:=False
             else
             begin
                  Cadena:=StringReplace(Cadena, '.', '',[rfReplaceAll]);
                  StrToFloat(Cadena);
                  Result:=True;
             end;
     except  //Al hacer la conversión se produce un error
          on E: Exception do
                Result:=False;
     end;
end;

//FUNCION QUE REDONDEA LOS DECIMALES QUE LE PASEMOS
//!!!!!!!!!!!!! SOLO CON COMA DECIMAL !!!!!!!!!!!!!
function Redondear(Valor:real;decimales:integer):real;overload;
var
  Adjust: real;
  LFactor: real;
  Posicion: Integer;
  Cadena: string;
begin
  //Calculamos el ajuste
  if (valor > 0) then
     Adjust := 0.5
  else
      Adjust := -0.5;
  //Calculamos el factor
  LFactor := IntPower(10,decimales);

  //Buscamos la coma decimal
  Cadena:=FloatToStr(Valor * LFactor + Adjust);
  Posicion:=Pos(',',Cadena);

  if Posicion<>0 then //Si hay coma decimal nos quedamos con la parte entera y dividimos por el Factor
     Result := StrToFloat(Copy(Cadena,1,Posicion-1))/LFactor
  else  //Si no hay coma decimal dividimos por el Factor
      Result:=((Valor * LFactor) + Adjust)/LFactor;
end;

//FUNCION QUE REDONDEA AL ENTERO MAS PROXIMO
function Redondear(valor:real):Integer;overload;
var
  Adjust: Double;
begin
  if (valor > 0) then Adjust := 0.5 else Adjust := -0.5;
  Result := Trunc(valor  + Adjust);
end;

//--- FUNCION QUE DEVUELVE LA PARTE ENTERA DE UN DECIMAL ----
function ParteEntera(Numero: Real):Integer;
Var
   Num: String;
   i: Integer;
begin
     Num:=FloatToStr(Numero);
     i:=Pos(',',Num);
     if i<>0 then
        result:=StrToInt(Copy(Num,1,i-1))
     else
         result:=StrToInt(Num);
end;

//--- FUNCION QUE DEVUELVE LA PARTE FRACCIONARIA DE UN DECIMAL ----
function ParteDecimal(Numero: Real):String;
Var
   Num: String;
   i: Integer;
begin
     Num:=FloatToStr(Numero);
     i:=Pos(',',Num);
     if i<>0 then
        result:=Copy(Num,i+1,Length(Num))
     else
         result:='0';
end;

//--- FUNCION QUE SOLUCIONA EL PROBLEMA DE StrToFloat CON LAS CADENAS VACIAS ---
function ValorFloat(Numero: String):Real;
begin
     try
         if Numero='' then
            Result:=0
         else
         begin
              Numero:=StringReplace(Numero, '.', '',[rfReplaceAll]);
              //Numero:=StringReplace(Numero, ',', '.',[rfReplaceAll]);
              Result:=StrToFloat(Numero);
         end;     
     except
           Result:=0;
     end;
end;

//FUNCIÓN QUE COMPRUEBA SI UNA FECHA ES CORRECTA
function EsFecha(Cadena:String):Boolean;overload;
begin
    try
       if Cadena<>'' then
       begin
            StrToDate(Cadena);
            Result:=True;
       end
       else
           Result:=False;
    except
       on E: Exception do
             Result:=False;
    end;
end;

//FUNCIÓN QUE COMPRUEBA SI UNA FECHA ES CORRECTA
function EsFecha(Fecha: TDateTime):Boolean;overload;
begin
    try
       DateToStr(Fecha);
       Result:=True;
    except
       on E: Exception do
             Result:=False;
    end;
end;

//DEVUELVE EL AÑO DE UNA FECHA
function Year(Fecha: TDateTime):Word;
Var
   Anyo, Mes, Dia: Word;
begin
     if EsFecha(Fecha) then
     begin
          DecodeDate(Fecha,Anyo,Mes,Dia);
          result:=Anyo;
     end
     else
         result:=0;
end;

//DEVUELVE EL MES DE UNA FECHA
function Month(Fecha: TDateTime):Word;
Var
   Anyo, Mes, Dia: Word;
begin
     if EsFecha(Fecha) then
     begin
          DecodeDate(Fecha,Anyo,Mes,Dia);
          result:=Mes;
     end
     else
         result:=0;
end;

//DEVUELVE EL DIA DE UNA FECHA
function Day(Fecha: TDateTime):Word;
Var
   Anyo, Mes, Dia: Word;
begin
     if EsFecha(Fecha) then
     begin
          DecodeDate(Fecha,Anyo,Mes,Dia);
          result:=Dia;
     end
     else
         result:=0;
end;

//---------------- CONVIERTE UNA FECHA CON FORMATO DD-MM-YYYY a YYYY-MM-DD ----
function AnyoMesDia(Fecha: String):String;overload;
begin
     result:=Copy(Fecha,7,4) + '/' + Copy(Fecha,4,2)+  '/' + Copy(Fecha,1,2);
end;

//---------------- CONVIERTE UNA FECHA CON FORMATO DD-MM-YYYY a YYYY-MM-DD -----
function AnyoMesDia(Fecha: TDateTime):String;overload;
Var
   Anyo, Mes, Dia: Word;
begin
     if EsFecha(Fecha) then
     begin
          DecodeDate(Fecha,Anyo,Mes,Dia);
          result:=RellenarCeros(IntToStr(Anyo),4,'I') + '/' + RellenarCeros(IntToStr(Mes),2,'I') + '/' + RellenarCeros(IntToStr(Dia),2,'I');
     end
     else
         result:='';
end;

//---------------- CONVIERTE UNA FECHA CON FORMATO YYYY-MM-DD a DD-MM-YYYY -----
function DiaMesAnyo(Fecha: String):String;
begin
     result:=Copy(Fecha,9,2) + '/' + Copy(Fecha,6,2)+  '/' + Copy(Fecha,1,4);
end;

//---------------- DEVUELVE LA PROVINCIA DE UN CODIGO POSTAL -------------------
function Provincia(Origen, CodigoPostal:String):String;
Var
   QAux: TQuery;
begin
     try
        if Origen = 'N' then
          begin
          if (Length(CodigoPostal)<>5) or (not EsNumerico(CodigoPostal)) then
             result:=''
          else
            begin
            QAux:=TQuery.Create(nil);
            try
              With QAux do
                begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT DESCRIPCION_P ' +
                        ' FROM PROVINCIAS ' +
                        ' WHERE CODIGO_P=' + QuotedStr(Copy(CodigoPostal,1,2)));
                Open;
                if not IsEmpty() then
                  result:=FieldByName('DESCRIPCION_P').AsString
                else
                  result:='';
                end;
            finally
              QAux.Close;
              FreeAndNil(QAux);
            end;
            end;
          end
        else
          result:= '';
     except
           result:='';
           raise;
     end;
end;

//----------------------- NOMBRE DEL TIPO DE USUARIO ---------------------------
function NomTipoUsuario(Usuario: String):String;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT DESCRIPCION_TU ' +
                        ' FROM TIPOS_USUARIO ' +
                        ' WHERE CODIGO_TU=' + QuotedStr(Usuario));
                Open;
                if not IsEmpty() then
                   result:=FieldByName('DESCRIPCION_TU').AsString
                else
                    result:='';
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           result:='';
           raise;
     end;
end;

//----------------------- NOMBRE DE LA EMPRESA ---------------------------------
function NomEmpresa(Empresa: String):String;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT NOMBRE_E ' +
                        ' FROM EMPRESAS ' +
                        ' WHERE CODIGO_E=' + QuotedStr(Empresa));
                Open;
                if not IsEmpty() then
                   result:=FieldByName('NOMBRE_E').AsString
                else
                    result:='';
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           result:='';
           raise;
     end;
end;

//----------------------- NOMBRE DE LA FAMILIA ---------------------------------
function NomFamilia(Empresa, Familia: String): String;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT DESCRIPCION_F ' +
                        ' FROM FAMILIAS ' +
                        ' WHERE EMPRESA_F=' + QuotedStr(Empresa) +
                        ' AND CODIGO_F=' + QuotedStr(Familia));
                Open;
                if not IsEmpty() then
                   result:=FieldByName('DESCRIPCION_F').AsString
                else
                    result:='';
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           result:='';
           raise;
     end;
end;

//----------------------- NOMBRE DEL ARTICULO ----------------------------------
function NomArticulo(Empresa, Familia, Articulo: String): String;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT DENOMINACION_A ' +
                        ' FROM ARTICULOS ' +
                        ' WHERE EMPRESA_A=' + QuotedStr(Empresa) +
                        ' AND FAMILIA_A=' + QuotedStr(Familia) +
                        ' AND CODIGO_A=' + QuotedStr(Articulo));
                Open;
                if not IsEmpty() then
                   result:=FieldByName('DENOMINACION_A').AsString
                else
                    result:='';
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           result:='';
           raise;
     end;
end;

//----------------------- NOMBRE DEL ARTICULO Y SU UNIDAD ----------------------
function NomArticuloUnidadFamilia(Empresa, Articulo: String; Var Familia: String): String;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT DENOMINACION_A, DES_ABREVIADA_U , FAMILIA_A ' +
                        ' FROM ARTICULOS, UNIDADES ' +
                        ' WHERE EMPRESA_U=EMPRESA_A ' +
                        ' AND CODIGO_U=UNIDAD_MEDIDA_A ' +
                        ' AND EMPRESA_A=' + QuotedStr(Empresa) +
                        ' AND CODIGO_A=' + QuotedStr(Articulo));
                Open;
                if not IsEmpty() then
                begin
                     Familia:=FieldByName('FAMILIA_A').AsString;
                     result:=FieldByName('DENOMINACION_A').AsString  + ' (' + FieldByName('DES_ABREVIADA_U').AsString + ')';
                end
                else
                    result:='';
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           result:='';
           raise;
     end;
end;


//----------------------- NOMBRE DE LA EMPRESA ---------------------------------
function NomCliente(Empresa, Cliente: String):String;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT NOMBRE_JURIDICO_C ' +
                        ' FROM CLIENTES ' +
                        ' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                        ' AND CODIGO_C=' + QuotedStr(Cliente));
                Open;
                if not IsEmpty() then
                   result:=FieldByName('NOMBRE_JURIDICO_C').AsString
                else
                    result:='';
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           result:='';
           raise;
     end;
end;

//----- DEVUELVE EL NOMBRE POR REFERENCIA DE LOS AUTORIZADOS DE UN CLIENTE -----
procedure NomAutorizadosCliente(Var Autorizado1, Autorizado2: String; Empresa, Cliente: String );
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT NOM_AUTORIZADO1_C, NOM_AUTORIZADO2_C ' +
                        ' FROM CLIENTES ' +
                        ' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                        ' AND CODIGO_C=' + QuotedStr(Cliente));
                Open;
                if not IsEmpty() then
                begin
                     Autorizado1:=FieldByName('NOM_AUTORIZADO1_C').AsString;
                     Autorizado2:=FieldByName('NOM_AUTORIZADO2_C').AsString;
                end
                else
                begin
                     Autorizado1:='';
                     Autorizado2:='';
                end;
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           raise;
     end;
end;

//----------------------- NOMBRE DE LA UNIDAD DE MEDIDA ------------------------
function NomUnidad(Empresa, Unidad: String):String;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT DESCRIPCION_U ' +
                        ' FROM UNIDADES ' +
                        ' WHERE EMPRESA_U=' + QuotedStr(Empresa) +
                        ' AND CODIGO_U=' + QuotedStr(Unidad));
                Open;
                if not IsEmpty() then
                   result:=FieldByName('DESCRIPCION_U').AsString
                else
                    result:='';
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           result:='';
           raise;
     end;
end;

//-------- NOMBRE ABREVIADO DE LA UNIDAD DE MEDIDA DE UN ARTICULO --------------
function NomUnidadAbreviada(Empresa, Familia, Articulo: String):String;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT DENOMINACION_A, DES_ABREVIADA_U , FAMILIA_A ' +
                        ' FROM ARTICULOS, UNIDADES ' +
                        ' WHERE EMPRESA_U=EMPRESA_A ' +
                        ' AND CODIGO_U=UNIDAD_MEDIDA_A ' +
                        ' AND EMPRESA_A=' + QuotedStr(Empresa) +
                        ' AND FAMILIA_A=' + QuotedStr(Familia) +
                        ' AND CODIGO_A=' + QuotedStr(Articulo));
                Open;
                if not IsEmpty() then
                   result:=FieldByName('DES_ABREVIADA_U').AsString
                else
                    result:='';
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           result:='';
           raise;
     end;
end;

//------------------------ DESCRIPCION DEL TIPO DE ORIGEN ----------------------
function  NomOrigen(Codigo: String):String;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT DESCRIPCION_O ' +
                        ' FROM ORIGENES ' +
                        ' WHERE CODIGO_O=' + QuotedStr(Codigo));
                Open;
                result:=FieldByName('DESCRIPCION_O').AsString;
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           result:='';
           raise;
     end;
end;

//------------- DEVUELVE LA DESCRIPCION DE UN TIPO DE ENTRADA ------------------
function NomTipoEntrada(Tipo: String):String;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT DESCRIPCION_TE ' +
                        ' FROM TIPOS_ENTRADA ' +
                        ' WHERE CODIGO_TE=' + QuotedStr(Tipo));
                Open;
                if not IsEmpty() then
                   result:=FieldByName('DESCRIPCION_TE').AsString
                else
                    result:='';
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           result:='';
           raise;
     end;
end;

//------------- DEVUELVE LA DESCRIPCION DE UN TIPO DE LOTE ---------------------
function NomTipoLote(Tipo: String):String;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT DESCRIPCION_TL' +
                        ' FROM TIPOS_LOTE ' +
                        ' WHERE CODIGO_TL=' + QuotedStr(Tipo));
                Open;
                if not IsEmpty() then
                   result:=FieldByName('DESCRIPCION_TL').AsString
                else
                    result:='';
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           result:='';
           raise;
     end;
end;

//------------- DEVUELVE LA DESCRIPCION DE UN TIPO DE COBRO ---------------------
function NomTipoCobro(Tipo: String):String;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT DESCRIPCION_TC' +
                        ' FROM TIPO_COBROS ' +
                        ' WHERE CODIGO_TC=' + QuotedStr(Tipo));
                Open;
                if not IsEmpty() then
                   result:=FieldByName('DESCRIPCION_TC').AsString
                else
                    result:='';
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           result:='';
           raise;
     end;
end;

//------------- DEVUELVE LA DESCRIPCION DE UN CONCEPTO ---------------------
function NomConcepto(Empresa, Concepto: String):String;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT DESCRIPCION_C' +
                        ' FROM CONCEPTOS ' +
                        ' WHERE EMPRESA_C =' + QuotedStr(Empresa) +
                        '   AND CODIGO_C =' + QuotedStr(Concepto));
                Open;
                if not IsEmpty() then
                   result:=FieldByName('DESCRIPCION_C').AsString
                else
                    result:='';
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           result:='';
           raise;
     end;
end;

//----------------------- DEVUELVE SI EXISTE UN ARTICULO -----------------------
function ExisteArticulo(Empresa, Familia, Articulo: String): Boolean; overload;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT * ' +
                        ' FROM ARTICULOS ' +
                        ' WHERE EMPRESA_A=' + QuotedStr(Empresa) +
                        ' AND FAMILIA_A=' + QuotedStr(Familia) +
                        ' AND CODIGO_A=' + QuotedStr(Articulo));
                Open;
                if not IsEmpty() then
                   result:=True
                else
                    result:=False;
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           result:=False;
           raise;
     end;
end;

//----------------------- DEVUELVE SI EXISTE UN ARTICULO -----------------------
function ExisteArticulo(Empresa, Articulo: String): Boolean;overload;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT * ' +
                        ' FROM ARTICULOS ' +
                        ' WHERE EMPRESA_A=' + QuotedStr(Empresa) +
                        ' AND CODIGO_A=' + QuotedStr(Articulo));
                Open;
                if not IsEmpty() then
                   result:=True
                else
                    result:=False;
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           result:=False;
           raise;
     end;
end;

//------------- LEE LA CONFIGURACION DEL CORREO DE UNA EMPRESA -----------------
function ConfiguracionCorreo(Empresa: String; Var Email, Smtp, Usuario, Password: String; Var PuertoSmtp: Integer): Boolean;
Var
   QAux: TQuery;
begin
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT * ' +
                        ' FROM CONFIG_CORREO ' +
                        ' WHERE EMPRESA_CC=' + QuotedStr(Empresa));
                Open;
                if not IsEmpty() then
                begin
                     Email:=FieldByName('Email_cc').AsString;
                     Smtp:=FieldByName('Smtp_cc').AsString;
                     Usuario:=FieldByName('Usuario_cc').AsString;
                     Password:=FieldByName('Password_cc').AsString;
                     PuertoSmtp:=FieldByName('Puerto_Smtp_cc').AsInteger;

                     Result:=True;
                end
                else
                    Result:=False;
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           raise;
     end;
end;

//------------- LEE LA CONFIGURACION DEL CORREO DE UNA EMPRESA -----------------
function CorreoCliente(Empresa, Cliente: String): String;
Var
   QAux: TQuery;
begin
     Result:='';
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT * ' +
                        ' FROM CLIENTES ' +
                        ' WHERE EMPRESA_C=' + QuotedStr(Empresa) +
                        ' AND CODIGO_C=' + QuotedStr(Cliente));
                Open;
                if not IsEmpty() then
                   Result:=FieldByName('Email_c').AsString
                else
                    Result:='';
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           raise;
     end;
end;

//------------------ DEVUELVE LA FAMILIA DE UN ARTICULO ------------------------
function  LeerFamilia(Empresa,Articulo:String):String;
Var
   QAux: TQuery;
begin
     Result:='';
     try
        QAux:=TQuery.Create(nil);
        try
           With QAux do
           begin
                DatabaseName:=DMBaseDatos.BDFrigo.DatabaseName;
                SQL.Add(' SELECT * ' +
                        ' FROM ARTICULOS ' +
                        ' WHERE EMPRESA_A=' + QuotedStr(Empresa) +
                        ' AND CODIGO_A=' + QuotedStr(Articulo));
                Open;
                if not IsEmpty() then
                   Result:=FieldByName('familia_a').AsString
                else
                    Result:='';
           end;
        finally
               QAux.Close;
               FreeAndNil(QAux);
        end;
     except
           raise;
     end;
end;

//-------------------------- LUPA DE EMPRESAS ----------------------------------
function LupaEmpresas():String;
Var
   Aux:TBusquedaEmpresas;
begin
     Aux:=TBusquedaEmpresas.Create(Nil);
     try
        with Aux do
        begin
             AceptarTodos:=False;
             EjecutarQuery();
             ShowModal;
             Result:=CodigoBus;     //Seleccionamos un registro del grid resultado
        end;
     finally
            FreeAndNil(Aux);
     end;
end;
//-------------------------- LUPA DE CLIENTES ----------------------------------
function LupaClientes(Empresa:String):String;
Var
   Aux:TBusquedaClientes;
begin
     Aux:=TBusquedaClientes.Create(Nil);
     try
        with Aux do
        begin
             AceptarTodos:=False;
             EmpresaParam:=Empresa;
             EjecutarQuery();
             ShowModal;
             if (EmpresaBus<>'') and (CodigoBus<>'') then        //Seleccionamos un registro del grid resultado
                Result:=CodigoBus;
        end;
     finally
            FreeAndNil(Aux);
     end;
end;
//-------------------------- LUPA DE TARIFAS -----------------------------------
function LupaTarifas(Empresa:String):String;
Var
   Aux: TBusquedaTarifas;
begin
     Aux:=TBusquedaTarifas.Create(Nil);
     try
        with Aux do
        begin
             AceptarTodos:=False;
             EmpresaParam:=Empresa;
             EjecutarQuery();
             ShowModal;
             if (EmpresaBus<>'') and (CodigoBus<>'') then        //Seleccionamos un registro del grid resultado
                Result:=CodigoBus;
        end;
     finally
            FreeAndNil(Aux);
     end;
end;

//-------------------------- LUPA DE FACTURAS ----------------------------------
function LupaFacturas(Empresa, Cliente: String; Var Fecha:String):String;
Var
   Aux: TBusquedaFacturas;
begin
     Aux:=TBusquedaFacturas.Create(Nil);
     try
        with Aux do
        begin
             AceptarTodos:=False;
             EmpresaParam:=Empresa;
             ClienteParam:=Cliente;
             if EjecutarQuery() then
             begin
                  ShowModal;
                  if (Aux.EmpresaBus<>'') and (Aux.ClienteBus<>'') and (Aux.NumFacturaBus<>'') then        //Seleccionamos un registro del grid resultado
                  begin
                       Fecha:=DateToStr(FechaBus);
                       Result:=NumFacturaBus;
                  end
                  else
                      Fecha:='';
             end
             else
                 MessageDlg (Chr(13) + 'No existen facturas para el cliente', mtError,[mbOk],0);
        end;
     finally
            FreeAndNil(Aux);
     end;
end;
//-------------------------- LUPA DE ARTICULOS ---------------------------------
function LupaArticulos(Empresa: String; Var Familia: String):String;
Var
   Aux: TBusquedaArticulos;
begin
     Aux:=TBusquedaArticulos.Create(Nil);
     try
        with Aux do
        begin
             AceptarTodos:=False;
             EmpresaParam:=Empresa;
             cFamiliaBus.Text:=Familia;
             ShowModal;
             if (EmpresaBus<>'') and (FamiliaBus<>'') and (CodigoBus<>'') then        //Seleccionamos un registro del grid resultado
             begin
                  Familia:=FamiliaBus;
                  Result:=CodigoBus;
             end;
        end;
     finally
            FreeAndNil(Aux);
     end;
end;

//-------------------------- LUPA DE ARTICULOS ---------------------------------
function LupaFamiliaArticulos(Empresa: String; Var Familia: String):String;
Var
   Aux: TBusquedaArticulos;
begin
     Aux:=TBusquedaArticulos.Create(Nil);
     try
        with Aux do
        begin
             AceptarTodos:=False;
             EmpresaParam:=Empresa;
             FamiliaParam:='';
             ShowModal;
             if (EmpresaBus<>'') and (FamiliaBus<>'') and (CodigoBus<>'') then        //Seleccionamos un registro del grid resultado
             begin
                  Familia:=FamiliaBus;
                  Result:=CodigoBus;
             end;
        end;
     finally
            FreeAndNil(Aux);
     end;
end;

//-------------------------- LUPA DE FAMILIAS ----------------------------------
function LupaFamilias(Empresa: String):String;
Var
   Aux: TBusquedaFamilias;
begin
     Aux:=TBusquedaFamilias.Create(Nil);
     try
        with Aux do
        begin
             AceptarTodos:=False;
             EmpresaParam:=Empresa;
            if EjecutarQuery() then
             begin
                  ShowModal;
                  if (EmpresaBus<>'') and (CodigoBus<>'') then        //Seleccionamos un registro del grid resultado
                     Result:=CodigoBus;
             end
             else
                 MessageDlg (Chr(13) + 'No existen familias para la empresa', mtError,[mbOk],0);
        end;
     finally
            FreeAndNil(Aux);
     end;
end;

//-------------------------- LUPA DE CONCEPTOS ----------------------------------
function LupaConceptos(Empresa: String):String;
Var
   Aux: TBusquedaConceptos;
begin
     Aux:=TBusquedaConceptos.Create(Nil);
     try
        with Aux do
        begin
             AceptarTodos:=False;
             EmpresaParam:=Empresa;
            if EjecutarQuery() then
             begin
                  ShowModal;
                  if (EmpresaBus<>'') and (CodigoBus<>'') then        //Seleccionamos un registro del grid resultado
                     Result:=CodigoBus;
             end
             else
                 MessageDlg (Chr(13) + 'No existen familias para la empresa', mtError,[mbOk],0);
        end;
     finally
            FreeAndNil(Aux);
     end;
end;

//-------------------------- LUPA DE UNIADES -----------------------------------
function LupaUnidades(Empresa: String):String;
Var
   Aux: TBusquedaUnidadesMedida;
begin
     Aux:=TBusquedaUnidadesMedida.Create(Nil);
     try
        with Aux do
        begin
             AceptarTodos:=False;
             EmpresaParam:=Empresa;
            if EjecutarQuery() then
             begin
                  ShowModal;
                  if (EmpresaBus<>'') and (CodigoBus<>'') then        //Seleccionamos un registro del grid resultado
                     Result:=CodigoBus;
             end
             else
                 MessageDlg (Chr(13) + 'No existen unideades para la empresa', mtError,[mbOk],0);
        end;
     finally
            FreeAndNil(Aux);
     end;
end;
//---------------------- LUPA DE LOTES -----------------------------------------
function LupaLotes(Empresa, Cliente, Lote, LoteOrigen: String):String;
Var
   Aux: TBusquedaLotes;
begin
     try
        Aux:=TBusquedaLotes.Create(Nil);
        with Aux do
        begin
             Query1.Close;
             Query1.SQL.Clear;
{
             Query1.SQL.Add(' SELECT LOTE_AL, TIPO_LOTE_AL, FAMILIA_AL, DESCRIPCION_F, ARTICULO_AL, ' +
                                   ' DENOMINACION_A, STATUS_RETENIDO_AL,  NUMERO_CAMARA_AL, ZONA_AL, ' +
                                   ' ESTUCHES_BULTO_AL, BULTOS_ENTRADOS_AL, BULTOS_SALIDOS_AL, ' +
                                   ' UNIDADES_ENTRADAS_AL, UNIDADES_SALIDAS_AL,UNIDADES_MERMAS_AL, UNIDADES_DESTRUIDAS_AL, ' +
                                   ' ESTUCHES_SUELTOS_AL, LOTE_ORIGEN_AL ' +
                            ' FROM ALMACENES, ARTICULOS, FAMILIAS ' +
                            ' WHERE EMPRESA_AL=EMPRESA_A ' +
                            ' AND FAMILIA_AL=FAMILIA_A ' +
                            ' AND ARTICULO_AL=CODIGO_A ' +
                            ' AND EMPRESA_F=EMPRESA_A ' +
                            ' AND CODIGO_F=FAMILIA_A ' +
                            ' AND EMPRESA_AL=' + QuotedStr(Empresa) +
                            ' AND CLIENTE_AL=' + QuotedStr(Cliente);
}
              Query1.SQL.Add(' SELECT LOTE_AL, TIPO_LOTE_AL, FAMILIA_AL, DESCRIPCION_F, ARTICULO_AL, ');
              Query1.SQL.Add('        DENOMINACION_A, STATUS_RETENIDO_AL,  NUMERO_CAMARA_AL, ZONA_AL, ');
              Query1.SQL.Add('        ESTUCHES_BULTO_AL, BULTOS_ENTRADOS_AL, BULTOS_SALIDOS_AL, ');
              Query1.SQL.Add('        UNIDADES_ENTRADAS_AL, UNIDADES_SALIDAS_AL,UNIDADES_MERMAS_AL, UNIDADES_DESTRUIDAS_AL, ');
              Query1.SQL.Add('        ESTUCHES_SUELTOS_AL, LOTE_ORIGEN_AL ');
              Query1.SQL.Add('   FROM ALMACENES, ARTICULOS, FAMILIAS ');
              Query1.SQL.Add('  WHERE EMPRESA_AL = EMPRESA_A ');
              Query1.SQL.Add('    AND FAMILIA_AL = FAMILIA_A ');
              Query1.SQL.Add('    AND ARTICULO_AL = CODIGO_A ');
              Query1.SQL.Add('    AND EMPRESA_F = EMPRESA_A ');
              Query1.SQL.Add('    AND CODIGO_F = FAMILIA_A ');
              Query1.SQL.Add('    AND EMPRESA_AL = ' + QuotedStr(Empresa) );
              Query1.SQL.Add('    AND CLIENTE_AL = ' + QuotedStr(Cliente) );
              if Lote <> '' then
                Query1.SQL.Add (' AND LOTE_AL = ' + QuotedStr(Lote));
              if LoteOrigen <> '' then
                Query1.SQL.Add(' AND LOTE_ORIGEN_AL = ' + QuotedStr(LoteOrigen));

             Query1.Open;
             if Query1.IsEmpty then
             begin
                  MessageDlg (Chr(13) + 'No existen lotes para el cliente', mtError,[mbOk],0);
                  Result:='';
             end
             else
             begin
                  SQLText := Query1.SQL.Text;
                  ShowModal;

                  Application.ProcessMessages;

                  if LoteBus<>'' then   //Seleccionamos un registro del grid resultado
                     Result:=LoteBus;

              end;
        end;
     finally
            FreeAndNil(Aux);
     end;
end;

function LupaLotesOrigen(Empresa, Cliente, Lote, LoteOrigen: String):String;
Var
   Aux: TBusquedaLotes;
begin
     try
        Aux:=TBusquedaLotes.Create(Nil);
        with Aux do
        begin
             Query1.Close;
             Query1.SQL.Clear;
              Query1.SQL.Add(' SELECT LOTE_AL, TIPO_LOTE_AL, FAMILIA_AL, DESCRIPCION_F, ARTICULO_AL, ');
              Query1.SQL.Add('        DENOMINACION_A, STATUS_RETENIDO_AL,  NUMERO_CAMARA_AL, ZONA_AL, ');
              Query1.SQL.Add('        ESTUCHES_BULTO_AL, BULTOS_ENTRADOS_AL, BULTOS_SALIDOS_AL, ');
              Query1.SQL.Add('        UNIDADES_ENTRADAS_AL, UNIDADES_SALIDAS_AL,UNIDADES_MERMAS_AL, UNIDADES_DESTRUIDAS_AL, ');
              Query1.SQL.Add('        ESTUCHES_SUELTOS_AL, LOTE_ORIGEN_AL ');
              Query1.SQL.Add('   FROM ALMACENES, ARTICULOS, FAMILIAS ');
              Query1.SQL.Add('  WHERE EMPRESA_AL = EMPRESA_A ');
              Query1.SQL.Add('    AND FAMILIA_AL = FAMILIA_A ');
              Query1.SQL.Add('    AND ARTICULO_AL = CODIGO_A ');
              Query1.SQL.Add('    AND EMPRESA_F = EMPRESA_A ');
              Query1.SQL.Add('    AND CODIGO_F = FAMILIA_A ');
              Query1.SQL.Add('    AND EMPRESA_AL = ' + QuotedStr(Empresa) );
              Query1.SQL.Add('    AND CLIENTE_AL = ' + QuotedStr(Cliente) );
              if Lote <> '' then
                Query1.SQL.Add (' AND LOTE_AL = ' + QuotedStr(Lote));
              if LoteOrigen <> '' then
                Query1.SQL.Add(' AND LOTE_ORIGEN_AL = ' + QuotedStr(LoteOrigen));

             Query1.Open;
             if Query1.IsEmpty then
             begin
                  MessageDlg (Chr(13) + 'No existen lotes para el cliente', mtError,[mbOk],0);
                  Result:='';
             end
             else
             begin
                  SQLText := Query1.SQL.Text;
                  ShowModal;

                  Application.ProcessMessages;
                Result := Query1.FieldByName('LOTE_ORIGEN_AL').asString;
              end;
        end;
     finally
            FreeAndNil(Aux);
     end;
end;

{
function LupaLotes(Empresa, Cliente: String):String;
begin
  Result := LupaLotes(Empresa, Cliente, '', '');
end;

function LupaLotes(Empresa, Cliente, Lote, LoteOrigen: String): String;
var
   Aux: TBusquedaLotes;
begin
  Result := '';
  try
    Aux := TBusquedaLotes.Create(nil, Empresa, Cliente, Lote, LoteOrigen, '');
    with Aux do
    begin
      Query1.Open;
      if Query1.IsEmpty then
      begin
        MessageDlg (Chr(13) + 'No existen lotes para el cliente', mtError,[mbOk],0);
        Result:='';
      end
      else
      begin
        if ShowModal = mrOk then
        begin
          Application.ProcessMessages;
          Result:=Query1.FieldByName('LOTE_AL').asString;
        end;
      end;
    end;
  finally
    Aux.Free;
  end;
end;

function LupaLotesOrigen(Empresa, Cliente, Lote, LoteOrigen: String): String;
var
   Aux: TBusquedaLotes;
begin
  Result := '';
  try
    Aux := TBusquedaLotes.Create(nil, Empresa, Cliente, Lote, LoteOrigen, '');
    with Aux do
    begin
      Query1.Open;
      if Query1.IsEmpty then
      begin
        MessageDlg (Chr(13) + 'No existen lotes para el cliente', mtError,[mbOk],0);
        Result:='';
      end
      else
      begin
        if ShowModal = mrOk then
        begin
          Result:=Query1.FieldByName('LOTE_ORIGEN_AL').asString;
        end;
        Application.ProcessMessages;
      end;
    end;
  finally
    Aux.Free;
  end;
end;
}
//****************************** IMPRIMIR  FACTURACION *************************
procedure ImprimirFacturacion(Definitiva: Boolean; NumFacturaDesde, NumFacturaHasta: Integer; Empresa, ClienteDesde, ClienteHasta: String; FechaFactura: TDateTime);
Var
   Facturita: TQRFactura;
begin
     try
        Facturita:=TQRFactura.Create(nil, Definitiva);
        try
           with Facturita do
           begin
                FacturaDefinitiva:=Definitiva; //Indica si es definitiva o informativa

                QClientes.Close;
                QClientes.SQL.Clear;
                QClientes.SQL.Add(' SELECT * FROM CLIENTES ' +
                                  ' WHERE EMPRESA_C=:Empresa ' +
                                  ' AND CODIGO_C=:Cliente ');
                QClientes.Prepare;

                QFacturasC.Close;
                QFacturasC.SQL.Clear;
                QFacturasL.Close;
                QFacturasL.SQL.Clear;
                QFacturasE.Close;
                QFacturasE.SQL.Clear;
                if Definitiva then
                begin
                     QFacturasC.SQL.Add(' SELECT * FROM CABECERA_FACTURAS ');
                     QFacturasL.SQL.Add(' SELECT * FROM LINEA_FACTURAS ');
                     QFacturasE.SQL.Add(' SELECT * FROM CONSUMO_ELECTRICO_FACTURAS ');
                end
                else
                begin
                     QFacturasC.SQL.Add(' SELECT * FROM TEMP_CABECERA_FACTURAS ');
                     QFacturasL.SQL.Add(' SELECT * FROM TEMP_LINEA_FACTURAS ');
                     QFacturasE.SQL.Add(' SELECT * FROM TEMP_CONSUMO_ELECTRICO_FACTURAS ');
                end;
                QFacturasC.SQL.Add(' WHERE EMPRESA_CF=' + QuotedStr(Empresa) +
                                   ' AND CLIENTE_CF BETWEEN ' + QuotedStr(ClienteDesde) + ' AND ' + QuotedStr(ClienteHasta) +
                                   ' AND NUMERO_FACTURA_CF BETWEEN ' + IntToStr(NumFacturaDesde) + ' AND ' + IntToStr(NumFacturaHasta) +
                                   ' AND FECHA_FACTURA_CF=' + QuotedStr(AnyoMesDia(FechaFactura)) +
                                   ' ORDER BY EMPRESA_CF, NUMERO_FACTURA_CF, CLIENTE_CF, FECHA_FACTURA_CF ');
                QFacturasL.SQL.Add(' WHERE EMPRESA_LF=:EMPRESA_CF ' +
                                   ' AND CLIENTE_LF=:CLIENTE_CF ' +
                                   ' AND NUMERO_FACTURA_LF=:NUMERO_FACTURA_CF ' +
                                   ' AND FECHA_FACTURA_LF=:FECHA_FACTURA_CF ' +
                                   ' ORDER BY EMPRESA_LF, NUMERO_FACTURA_LF, CLIENTE_LF, NUMERO_LINEA_LF');
                QFacturasE.SQL.Add(' WHERE EMPRESA_CEF=:EMPRESA_CF ' +
                                   ' AND CLIENTE_CEF=:CLIENTE_CF ' +
                                   ' AND NUMERO_FACTURA_CEF=:NUMERO_FACTURA_CF ' +
                                   ' AND FECHA_FACTURA_CEF=:FECHA_FACTURA_CF ' +
                                   ' ORDER BY EMPRESA_CEF, NUMERO_FACTURA_CEF, CLIENTE_CEF, NUMERO_LINEA_CEF');

                QFacturasC.Open;
                if not QFacturasC.IsEmpty then
                begin
                     QFacturasL.Open;
                     QFacturasE.Open;
                     if not QFacturasL.IsEmpty then
                     begin
                          if Definitiva then
                             ReportTitle:='Facturación Definitiva'
                          else
                              ReportTitle:='Facturación Informativa';
                          Preview;
                     end
                     else
                         MessageDlg (Chr(13) + 'Si la factura fue generada con el programa antiguo no se puede imprimir', mtInformation,[mbOk],0);
                end
                else
                    MessageDlg (Chr(13) + 'No existen facturas', mtError,[mbOk],0);
           end;
        finally
               Facturita.QClientes.Close;
               FreeAndNil(Facturita);
        end;
     except
            On E:Exception do
                 MessageDlg(E.Message,mtError,[mbOK],0);
     end;
end;

end.
