unit CadProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, CadModelo, DB;

type

  { TCadProdutoF }

  TCadProdutoF = class(TCadModeloF)
    procedure BtnFECHARClick(Sender: TObject);
    procedure BtnNOVOClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure dsCadModeloDataChange(Sender: TObject; Field: TField);
  private

  public

  end;

var
  CadProdutoF: TCadProdutoF;

implementation

{$R *.lfm}

{ TCadProdutoF }

procedure TCadProdutoF.BtnFECHARClick(Sender: TObject);
begin
  inherited;
end;

procedure TCadProdutoF.BtnNOVOClick(Sender: TObject);
begin

end;

procedure TCadProdutoF.Button1Click(Sender: TObject);
begin

end;

procedure TCadProdutoF.Button4Click(Sender: TObject);
begin

end;

procedure TCadProdutoF.Button5Click(Sender: TObject);
begin

end;

procedure TCadProdutoF.dsCadModeloDataChange(Sender: TObject; Field: TField);
begin

end;

end.

