unit frPessoas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, cxNavigator,
  cxDBNavigator, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSpinEdit, cxDBEdit, cxRadioGroup, cxMaskEdit,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel;

type
  TTelaPessoas = class(TForm)
    lbCodigo: TcxLabel;
    edCodigo: TcxDBTextEdit;
    lbNome: TcxLabel;
    edNome: TcxDBTextEdit;
    lbDocumento: TcxLabel;
    lbEndereco: TcxLabel;
    edEndereco: TcxDBTextEdit;
    lbBairro: TcxLabel;
    edBairro: TcxDBTextEdit;
    edTelefone: TcxDBMaskEdit;
    edCelular: TcxDBMaskEdit;
    lbTelefone: TcxLabel;
    lbCelular: TcxLabel;
    rgSexo: TcxDBRadioGroup;
    edNumero: TcxDBSpinEdit;
    lbNumero: TcxLabel;
    lcCidade: TcxDBLookupComboBox;
    lbCidade: TcxLabel;
    nvPessoas: TcxDBNavigator;
    quPessoas: TZQuery;
    dsPessoas: TDataSource;
    dsCidades: TDataSource;
    quCidades: TZQuery;
    lcPesquisa: TcxLookupComboBox;
    lbPesquisa: TcxLabel;
    edDocumento: TcxDBMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaPessoas: TTelaPessoas;

implementation

uses udmConexao;

{$R *.dfm}

end.
