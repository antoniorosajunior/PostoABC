object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Posto ABC - Sistema de Abastecimento'
  ClientHeight = 400
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object MenuItemLancamento: TMenuItem
      Caption = '&Lan'#231'amento'
      OnClick = MenuItemLancamentoClick
    end
    object MenuItemRelatorio: TMenuItem
      Caption = '&Relat'#243'rio'
      OnClick = MenuItemRelatorioClick
    end
    object Sair1: TMenuItem
      Caption = '&Sair'
      OnClick = Sair1Click
    end
  end
end
