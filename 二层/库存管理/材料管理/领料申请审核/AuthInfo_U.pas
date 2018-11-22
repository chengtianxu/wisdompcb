unit AuthInfo_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, ADODB, StdCtrls;

type
  TAuthInfo = class(TForm)
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    ADOQuery1USER_FULL_NAME: TStringField;
    ADOQuery1auth_date: TDateTimeField;
    ADOQuery1ranking: TWordField;
    ADOQuery1auth_flag: TStringField;
    ADOQuery1remark: TStringField;
    ADOQuery1user_ptr: TIntegerField;
    ADOQuery1apply_ptr: TIntegerField;
    ADOQuery1RPL_USER_FULL_NAME: TStringField;
    ADOQuery1draw_materiel_ptr: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AuthInfo: TAuthInfo;

implementation

uses damo;
{$R *.dfm}

end.

