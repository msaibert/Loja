object TelaPrincipal: TTelaPrincipal
  Left = 1118
  Top = 218
  Caption = 'T-Rex'
  ClientHeight = 579
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 568
    Top = 112
    object miCadastros: TMenuItem
      Caption = 'Cadastros'
      object miPessoas: TMenuItem
        Caption = 'Pessoas'
        OnClick = miPessoasClick
      end
      object miUsuarios: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = miUsuariosClick
      end
      object miProdutos: TMenuItem
        Caption = 'Produtos'
        OnClick = miProdutosClick
      end
      object miCategorias: TMenuItem
        Caption = 'Categorias'
        OnClick = miCategoriasClick
      end
      object miFormasdePagamento: TMenuItem
        Caption = 'Formas de Pagamento'
        OnClick = miFormasdePagamentoClick
      end
      object miOperacoes: TMenuItem
        Caption = 'Opera'#231#245'es'
        OnClick = miOperacoesClick
      end
    end
  end
end
