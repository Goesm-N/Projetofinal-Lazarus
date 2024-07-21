program prjPROJETO;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, datetimectrls, zcomponent, CadModelo, DM, MenuPrincipal, CadClientes,
  CadProdutos, CadUsuarios, PesqCat, cadcategoria, Sobre, Orcamentos, PesqMod,
  pesqcliente, selprod, PesqProd, relprod, RelOrc, RelCat, TelaLogin;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TDMF, DMF);
  Application.CreateForm(TTelaLoginF, TelaLoginF);
  Application.CreateForm(TCadModeloF, CadModeloF);
  Application.Run;
end.

