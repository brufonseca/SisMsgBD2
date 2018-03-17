unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Menus, StdCtrls;

type
  TTELAPrincipal = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
     Edio1: TMenuItem;
      Comousar1: TMenuItem;
      Sobre2: TMenuItem;
     Sair1: TMenuItem;
     Fim1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Sobre2Click(Sender: TObject);
    procedure Edio1Click(Sender: TObject);
    procedure Comousar1Click(Sender: TObject);
    procedure Fim1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TELAPrincipal: TTELAPrincipal;

implementation

uses USobre, UEdicao;    

{$R *.dfm}

procedure TTELAPrincipal.Sair1Click(Sender: TObject);
begin
   Application.Terminate
end;

procedure TTELAPrincipal.Sobre2Click(Sender: TObject);
begin
  TELASobre.ShowModal
end;

procedure TTELAPrincipal.Edio1Click(Sender: TObject);
begin
  TELAEdicao.ShowModal
end;

procedure TTELAPrincipal.Fim1Click(Sender: TObject);
begin
 Application.Terminate
end;

procedure TTELAPrincipal.Comousar1Click(Sender: TObject);
begin
   showmessage('*** Mensagens Secretas ***'+ #13#10+
               '1- Escreva sua mensagem de amor'+ #13#10+
               '2- Clique no botão Converte'+ #13#10+
               '3- Copie a mensagem convertida'+ #13#10+
               '4- Envie para o seu amor secreto')
end;

end.
