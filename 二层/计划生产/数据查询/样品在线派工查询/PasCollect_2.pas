unit PasCollect_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls;

type
  TFrmCollect2 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    ADOQuery1: TADOQuery;
    ADOQuery1DEPT_CODE: TStringField;
    ADOQuery1DEPT_NAME: TStringField;
    ADOQuery1d34Rkey: TAutoIncField;
    ADOQuery1iTotal: TIntegerField;
    ADOQuery1iPunctual: TIntegerField;
    ADOQuery1iPunctual2: TIntegerField;
    ADOQuery1dOnceFulfille: TBCDField;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCollect2: TFrmCollect2;

implementation

{$R *.dfm}

end.
