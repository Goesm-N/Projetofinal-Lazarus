unit MenuPrincipal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, cadcategoria, CadClientes,
  CadProdutos, CadUsuarios, Orcamentos, Sobre, RelMod, relprod, RelOrc;

type

  { TMenuPrincipalF }

  TMenuPrincipalF = class(TForm)
    MainMenu1: TMainMenu;
    MnSobre: TMenuItem;
    MnSair: TMenuItem;
    MnRCategoria: TMenuItem;
    MnROrcamento: TMenuItem;
    MnRProdutos: TMenuItem;
    MnRClientes: TMenuItem;
    MnRelatorios: TMenuItem;
    MnVendas: TMenuItem;
    MnOrcamento: TMenuItem;
    MnCadastros: TMenuItem;
    MnCategoria: TMenuItem;
    MnCliente: TMenuItem;
    MnProduto: TMenuItem;
    MnUsuarios: TMenuItem;
    Separator1: TMenuItem;
    procedure MnCategoriaClick(Sender: TObject);
    procedure MnClienteClick(Sender: TObject);
    procedure MnOrcamentoClick(Sender: TObject);
    procedure MnProdutoClick(Sender: TObject);
    procedure MnRClientesClick(Sender: TObject);
    procedure MnROrcamentoClick(Sender: TObject);
    procedure MnRProdutosClick(Sender: TObject);
    procedure MnSairClick(Sender: TObject);
    procedure MnSobreClick(Sender: TObject);
    procedure MnUsuariosClick(Sender: TObject);
  private

  public

  end;

var
  MenuPrincipalF: TMenuPrincipalF;

implementation

{$R *.lfm}

{ TMenuPrincipalF }
{ TODO -oEU -cEU: ARRUMAR TODAS OS CADS TA MTO FEIO PQP. CHAMAR RELATORIOS PELOS RELS. ARRUMAR DISPLAYMODE DAS TELAS}
procedure TMenuPrincipalF.MnCategoriaClick(Sender: TObject);
begin
     CadCategoriaF:= TCadCategoriaF.Create(Self);
     CadCategoriaF.Show;
end;

procedure TMenuPrincipalF.MnClienteClick(Sender: TObject);
begin
     CadClientesF:= TCadClientesF.Create(Self);
     CadClientesF.Show;

end;

procedure TMenuPrincipalF.MnOrcamentoClick(Sender: TObject);
begin
  OrcamentosF:= TOrcamentosF.Create(Self);
  OrcamentosF.Show;
end;

procedure TMenuPrincipalF.MnProdutoClick(Sender: TObject);
begin
     CadProdutosF:= TCadProdutosF.Create(Self);
     CadProdutosF.Show;
end;

procedure TMenuPrincipalF.MnRClientesClick(Sender: TObject);
begin
    RelModF:= TRelModF.Create(Self);
    RelModF.Show;
end;

procedure TMenuPrincipalF.MnROrcamentoClick(Sender: TObject);
begin
    RelOrcF:= TRelOrcF.Create(Self);
    RelOrcF.Show;
end;

procedure TMenuPrincipalF.MnRProdutosClick(Sender: TObject);
begin
    RelProdF:= TRelProdF.Create(Self);
    RelProdF.Show;    //RelProd
end;

procedure TMenuPrincipalF.MnUsuariosClick(Sender: TObject);
begin
     CadUsuariosF:= TCadUsuariosF.Create(Self);
     CadUsuariosF.Show;
end;

procedure TMenuPrincipalF.MnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMenuPrincipalF.MnSobreClick(Sender: TObject);
begin
  SobreF:= TSobreF.Create(Self);
  SobreF.Show;
end;

end.

