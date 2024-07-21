unit TelaLogin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, MenuPrincipal;

type

  { TTelaLoginF }

  TTelaLoginF = class(TForm)
    Entrar: TButton;
    Sair: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    procedure EntrarClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure Shape1ChangeBounds(Sender: TObject);
  private

  public

  end;

var
  TelaLoginF: TTelaLoginF;

implementation

{$R *.lfm}

{ TTelaLoginF }

procedure TTelaLoginF.Shape1ChangeBounds(Sender: TObject);
begin

end;

procedure TTelaLoginF.SairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TTelaLoginF.EntrarClick(Sender: TObject);
begin
  MenuPrincipalF:= TMenuPrincipalF.Create(Self);
  MenuPrincipalF.Show;
end;

end.

