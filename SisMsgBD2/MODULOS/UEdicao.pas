unit UEdicao;

INTERFACE

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Menus, Buttons,

  sqlitetable3, ExtDlgs;//<<==    // este modulo so usa rotinas dessa unit

type
  TTELAEdicao = class(TForm)
    LblTOrig: TLabel;
     MmoOriginal: TMemo;
    LblTConv: TLabel;
     MmoConvertido: TMemo;

    LblPUC_RIO: TLabel;
    Image1: TImage;

    BtnLimpa: TButton;
    BtnConverte: TButton;
    BtAdd: TButton;
    btnGrava: TBitBtn;
    Panel1: TPanel;
     LblVerMsg: TLabel;
     btnPREV: TButton;
     btnPROX: TButton;
    Image2: TImage;
    btnAddImagem: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Sobre2Click(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure BtnConverteClick(Sender: TObject);
    procedure BtAddClick(Sender: TObject);
    procedure btnGravaClick(Sender: TObject);
    procedure btnPREVClick(Sender: TObject);
    procedure btnPROXClick(Sender: TObject);
    procedure btnAddImagemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var   // para todas as rotinas
      TELAEdicao: TTELAEdicao; // form de edicao
      NB:STRING='MSGS.DB';     //<<== Nome do BD das msgs
      // vai usar uma variavel B como um bd B e uma var TT como tabela
      B:tSQLITEDATABASE;  TT:tsqliteUnitable;
      NN:integer; //NN tam da tabela de mensagens
      i: integer; // linha corrente na tabela de mensagens

IMPLEMENTATION

uses USobre;

{$R *.dfm}
//===================================================
Procedure MsgToMemo1(Var memo1:Tmemo; Var img:Timage; n:integer);
// pega na nesima linha da tabela de msgs as cols  msg,autor => memo1 e autor
var
ms:TMemoryStream; pic:TJPegImage;
begin
  tt:=b.GetUniTable('select msg,foto from msgss2 where num='+inttostr(n));
  with tt do begin
    if FieldIsNull(0) then  memo1.Text:= ' Msg nula '
    else  memo1.Text:=  FieldAsBlobtext (0); // msg na col 0

    if tt.FieldIsNull(1) then begin
        showmessage('Mensagem sem imagem cadastrada!');
        img.Visible:=false
     end
     else begin
        ms:=FieldAsBlob(FieldIndex['foto']);
        ms.Position:=0;
        pic:=TJPEGImage.Create;
        pic.LoadFromStream(ms);
        img.Picture.graphic:=pic;
        img.Visible:=true;
        img.Stretch:=true
     end;
  end;
  TT.Free;
end;

//
// Codifica UM STRING
//
function converte(s:string):string;
 const c: string = 'gaderypolutiGADERYPOLUTI';
 var   p, j,  t : integer; ch: char;  ss: string;
begin
 //  s:= MmoOriginal.Text;
 ss:= ''; t := length(s);
 if t>0 then  begin   // se t<=0 nao faz nada
   ch := s[1];
   j:= 1;
   while j<=t do
   begin
      { processa o dado }
      p:= pos(ch, c);
      if p< 1
      then
      else if  p mod 2  = 0
               then ch := c[p-1]
               else ch := c[p+1];
      ss:= ss + ch;
      { obtem o próximo }
      j:= j+1; ch:= s[j]
   end;
 end;
 converte:=ss;//  se t<= 0 o ss eh ''
end;
//==================================
procedure TTELAEdicao.btnGravaClick(Sender: TObject);
// grava uma msg convertida

begin
   if length(MmoConvertido.Text)<=0
      then showmessage('Não há msg para gravar.Clicar em converter!')
   else
    begin
     SHOWMESSAGE('Gravando na linha '+inttostr(i)+' da Tab de Msg') ;
     tt:=b.GetUniTable
      ('Update msgss2 set msgc= "'+MmoConvertido.text+'" where num='+inttostr(i));
     showmessage('Mensagem gravada!')  
    end;
    TT.Free;
end;

procedure TTELAEdicao.BtAddClick(Sender: TObject);
//adiciona nova msg na tab de msgs ( use foto nula)
begin
 if length(MmoOriginal.Text)>0 then begin
 // if EdtAutor.text='' then  EdtAutor.text:='[?]';
  tt:=b.GetUniTable
   ('insert into msgss2 values(null,"'+MmoOriginal.Text+'",null,null)');
  inc(NN);i:=NN; showmessage(' Nova Msg adicionada!');  
  tt.Free
 end
 else showmessage(' Escreva a nova Msg !');
end;

procedure TTELAEdicao.BtnConverteClick(Sender: TObject);
var s: string;
// converte a msgoriginal
begin
   s:= MmoOriginal.Text;
   if length(s)>0 then
     MmoConvertido.Text:=converte(s)
   else showmessage('Msg a converter faltando!');
end;

procedure TTELAEdicao.Sair1Click(Sender: TObject);
begin
   Application.Terminate
end;

procedure TTELAEdicao.Sobre2Click(Sender: TObject);
begin
   TELASobre.showmodal
end;

procedure TTELAEdicao.BtnLimpaClick(Sender: TObject);
begin
   MmoOriginal.Clear;
   MmoConvertido.clear;
   MmoOriginal.SetFocus;
   Image2.Visible:=false;
   i:=1;
end;

procedure TTELAEdicao.btnPREVClick(Sender: TObject);
begin
   dec(i);
   if i>=1 then  begin
      MsgToMemo1(MmoOriginal,image2,i)
   end
   else i:=1;   // parar na msg 1
   MmoConvertido.Clear;
end;

procedure TTELAEdicao.btnPROXClick(Sender: TObject);
begin
  inc(i);
  if i<= NN then begin
      MsgToMemo1(MmoOriginal,image2,i)
  end
  else i:=NN;   // parar na msg NN
  MmoConvertido.Clear
end;


procedure TTELAEdicao.btnAddImagemClick(Sender: TObject);
var
inspic:integer; arquivo:string;
ms:TMemoryStream;
begin
inspic:=MessageDlg('Deseja cadastrar uma imagem para a mensagem?',mtConfirmation,mbYesNo,0);
  if inspic=6 then begin
  if OpenPictureDialog1.Execute() then begin
   arquivo:=OpenPictureDialog1.FileName;
        // showmessage(arquivo);
         ms:=TMemoryStream.Create;
         ms.LoadFromFile(arquivo);
        // showmessage('UPDATE MSGSS2 SET FOTO=? WHERE NUM='+inttostr(i)+';');

         b.UpdateBlob('UPDATE MSGSS2 SET FOTO=? WHERE NUM='+inttostr(i)+';',ms)  ;

         MsgToMemo1(MmoOriginal,image2,i);


          end;
  end;
end;

procedure TTELAEdicao.FormCreate(Sender: TObject);
begin
   i:= 1;  // CARREGA A 1A MSG
      MsgToMemo1(MmoOriginal,image2,1); MmoConvertido.Clear;
      Image2.Stretch:=True;
      
//      Image2.Picture.LoadFromFile('..\\DADOS\fotos\amor'+inttostr(i)+'.bmp');
end;

BEGIN
 b:=tSQLITEdATABASE.create('..\dados\'+nb);   //abre o bd
 tt:= b.GetUniTable('select count (*) from msgss2;');   //
 NN:= tt.FieldAsInteger(0);  // NN tam da tabela de msgs
 tt.Free
end.
