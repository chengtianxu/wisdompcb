unit AuthInfo_Mod280;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Data.DB,
  Datasnap.DBClient;

type
  TFrmAuthInfo_Mod280 = class(TfrmBase)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    RkyTjsprq: TRKeyRzBtnEdit;
    RkyZhsprq: TRKeyRzBtnEdit;
    RkyTjcgrq: TRKeyRzBtnEdit;
    RkyTjcgry: TRKeyRzBtnEdit;
    ds276: TDataSource;
    cds276: TClientDataSet;
    cds05: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAuthInfo_Mod280: TFrmAuthInfo_Mod280;

implementation

{$R *.dfm}

end.
