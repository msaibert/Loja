unit frOperacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxRadioGroup, cxDBEdit, cxCheckBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxNavigator, cxDBNavigator;

type
  TTelaOperacoes = class(TForm)
    edCodigo: TcxDBTextEdit;
    edDescricao: TcxDBTextEdit;
    cbEstoque: TcxDBCheckBox;
    rgEstoque: TcxDBRadioGroup;
    cbCaixa: TcxDBCheckBox;
    rgCaixa: TcxDBRadioGroup;
    lbCodigo: TcxLabel;
    lbDescricao: TcxLabel;
    quOperacoes: TZQuery;
    dsOperacoes: TDataSource;
    nvOperacoes: TcxDBNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaOperacoes: TTelaOperacoes;

implementation

uses udmConexao;

{$R *.dfm}

end.
