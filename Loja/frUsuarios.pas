unit frUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxNavigator, cxDBNavigator, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxControls, cxContainer, cxEdit, cxLabel, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TTelaUsuarios = class(TForm)
    lbPessoa: TcxLabel;
    lcPessoa: TcxDBLookupComboBox;
    edLogin: TcxDBTextEdit;
    edPassWord: TcxDBMaskEdit;
    nvUsuarios: TcxDBNavigator;
    lbLogin: TcxLabel;
    lbSenha: TcxLabel;
    lbConfirmarSenha: TcxLabel;
    quUsuarios: TZQuery;
    dsUsuarios: TDataSource;
    dsPessoa: TDataSource;
    quPessoa: TZQuery;
    edConfirmarSenha: TcxMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaUsuarios: TTelaUsuarios;

implementation

uses udmConexao;

{$R *.dfm}

end.
