unit DMUnit1;

//Provider=SQLOLEDB.1;Password=WZtopcberp_1077;Persist Security Info=True;User ID=wzsp;Initial Catalog=WISDOMPCB;Data Source=W001057;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=W119;Use Encryption for Data=False;Tag with column collation when possible=False

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    wzcx0006_1: TADOStoredProc;
    DataSource1: TDataSource;
    wzcx0006_1WORK_ORDER_NUMBER: TStringField;
    wzcx0006_1MANU_PART_NUMBER: TStringField;
    wzcx0006_1MANU_PART_DESC: TStringField;
    wzcx0006_1EMPLOYEE_NAME: TStringField;
    wzcx0006_1TDATE: TDateTimeField;
    wzcx0006_1SOURCE_PTR: TIntegerField;
    wzcx0006_1NOTE_PAD_LINE: TStringField;
    wzcx0006_1ACTION: TSmallintField;
    wzcx0006_1MyACTION: TStringField;
    wzcx0006_1CUST_CODE: TStringField;
    wzcx0006_1ABBR_NAME: TStringField;
    wzcx0006_1CUSTOMER_NAME: TStringField;
    wzcx0006_1remark: TStringField;
    procedure wzcx0006_1BeforeOpen(DataSet: TDataSet);
    procedure wzcx0006_1AfterClose(DataSet: TDataSet);
    procedure wzcx0006_1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    rkey06:integer;
    vfind:boolean;
    procedure Set_find1(const Value: boolean);
  public
    { Public declarations }
    property find1:boolean write Set_find1;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.wzcx0006_1BeforeOpen(DataSet: TDataSet);
begin
  vfind:=false;
end;

procedure TDM.wzcx0006_1AfterClose(DataSet: TDataSet);
begin
  vfind:=false;
end;

procedure TDM.Set_find1(const Value: boolean);
begin
  vfind:=value;
end;

procedure TDM.wzcx0006_1CalcFields(DataSet: TDataSet);
begin
   if wzcx0006_1.Active then
       begin
            case wzcx0006_1ACTION.Value of
                0:   wzcx0006_1MYACTION.Value :=  '从报废中创建';
                1:   wzcx0006_1MYACTION.Value := '暂停生产';
                2:   wzcx0006_1MYACTION.Value := '恢复生产';
                3:   wzcx0006_1MYACTION.Value := '取消作业单';
                4:   wzcx0006_1MYACTION.Value := '恢复作业单';
                5:   wzcx0006_1MYACTION.Value := '作业单返工';
                6:   wzcx0006_1MYACTION.Value := '数量分拆';
                7:   wzcx0006_1MYACTION.Value := '作业单更改';
                8:   wzcx0006_1MYACTION.Value := '修改数量';
                end;

            if not wzcx0006_1remark.IsNull then
                wzcx0006_1NOTE_PAD_LINE.value := wzcx0006_1remark.Value;
            {
            if not wzcx0006_1NOTE_PAD_LINE_1.IsNull then
                wzcx0006_1NOTE_PAD_LINE.value := wzcx0006_1NOTE_PAD_LINE_1.Value;
            if not wzcx0006_1NOTE_PAD_LINE_2.IsNull then
                wzcx0006_1NOTE_PAD_LINE.value:= wzcx0006_1NOTE_PAD_LINE.value+wzcx0006_1NOTE_PAD_LINE_2.Value;
            if not wzcx0006_1NOTE_PAD_LINE_3.IsNull then
                wzcx0006_1NOTE_PAD_LINE.value:= wzcx0006_1NOTE_PAD_LINE.value+wzcx0006_1NOTE_PAD_LINE_3.Value;
            if not wzcx0006_1NOTE_PAD_LINE_4.IsNull then
                wzcx0006_1NOTE_PAD_LINE.value:= wzcx0006_1NOTE_PAD_LINE.value+wzcx0006_1NOTE_PAD_LINE_4.Value  ;
            {}
       end ;
end;

end.
