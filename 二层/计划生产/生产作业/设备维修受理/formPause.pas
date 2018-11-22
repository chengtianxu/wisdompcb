unit formPause;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGridEh, ExtCtrls, Buttons, ToolWin, ComCtrls,
  StdCtrls, ADODB, DBGrids;

type
  TfrmPause = class(TForm)
    ToolBar1: TToolBar;
    tbSave: TSpeedButton;
    tbCancel: TSpeedButton;
    tbDelete: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    DBGridEh1: TDBGridEh;
    procedure tbDeleteClick(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbSaveClick(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Function  GetSmallDatetime(Qry:TADOQuery):TDateTime;
    { Private declarations }
  public
    vRights:Integer;
    vEmplRkey:Integer;

    procedure SetButtonStatus(Flag: Boolean);
    { Public declarations }
  end;

var
  frmPause: TfrmPause;
  

implementation

uses damo, main,common;

{$R *.dfm}

Function  TfrmPause.GetSmallDatetime(Qry:TADOQuery):TDateTime;
begin
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text:='select cast(getdate()as smallDatetime)'  ;
  Qry.Open;
  Result:=Qry.FieldList[0].AsDateTime;
end;

procedure TfrmPause.SetButtonStatus(Flag: Boolean);
begin                       //（状态 =已受理 ）和(或者 )
//  tbDelete.Enabled :=False;
  DBGridEh1.FieldColumns['remark'].ReadOnly:=true;
  DBGridEh1.FieldColumns['stop_end_date']  .ReadOnly:=true;
  DBGridEh1.FieldColumns['stop_end_date']  .ReadOnly:=true;

  if (DM.cDS567STATUS.AsInteger in [2,6])then  // 2 已受理 6  已暂停
  begin
    if vRights in [2,3,4] then
    begin
      DBGridEh1.FieldColumns['remark'].ReadOnly:=False;
//      tbDelete.Enabled  :=(not Flag)and (DM.qry577.IsEmpty=False);    //删除
//      DBGridEh1.FieldColumns['stop_end_date']  .ReadOnly:=False;
//      DBGridEh1.FieldColumns['stop_end_date']  .ReadOnly:=False;
    end;
  end
  else
  if (DM.cDS567STATUS.AsInteger in [3])then  // 3 已完工
  begin
    if vRights in [4] then
    begin
//      tbDelete.Enabled  :=(not Flag)and (DM.qry577.IsEmpty=False);    //删除
      DBGridEh1.FieldColumns['stop_end_date']  .ReadOnly:=False;
      DBGridEh1.FieldColumns['stop_end_date']  .ReadOnly:=False;
      DBGridEh1.FieldColumns['remark']         .ReadOnly:=False;
    end;
  end;

end;

procedure TfrmPause.tbDeleteClick(Sender: TObject);
//var
//  strSQL:string;
//  isPause:Boolean;
begin
//  if messagedlg('你确定要删除吗?删除后将不能恢复！',mtconfirmation,[mbyes,mbno],0) = mryes  then
//  with DM do
//  begin
//    try
//      try
//        DM.ADOConnection.BeginTrans;
//        qry577.Delete;
//        if DM.cds567STATUS.AsInteger in[2,6] then
//        begin
//          isPause:=False;
//          with  DM.ADOQuery1 do
//          begin
//            Clone(qry577);
//            while not Eof do
//            begin
//              if fieldByName('stop_end_date').isnull then
//              begin
//                isPause:=True;
//                Break;
//              end;
//              Next;
//            end;
//          end;
//
//          with  DM  do
//          begin
//            cDS567.Edit;
//            if isPause=True then
//            begin
//              cDS567STATUS.AsInteger:=6                //修改状态为已暂停
//            end
//            else
//            begin
//              cDS567STATUS.AsInteger:=2;           //修改状态为执行中
//            end;
//          end;
//        end;
//        strSQL:= 'select isnull(cast(sum(datediff(minute,[stop_begin_date],[stop_end_date]))as dec(10,2))/60,0)  '
//           +' from data0577 where rkey567='+dm.cDS567.FieldByName('rkey').AsString ;
//        with DM.cDS567 do
//        begin
//          Edit;
//     //     ShowMessage(form1.SQLResultValue(DM.ADOQuery1,strSQL));
//          FieldByName('stop_house').Value:= StrToFloat(form1.SQLResultValue(DM.ADOQuery1,strSQL));
//          Post;
//
//        end;
//
//        if DM.cDS567.State in [dsEdit] then
//          DM.cDS567.Post;
//        if DM.cDS567.ApplyUpdates(0)<>0 then
//          DM.ADOConnection.RollbackTrans;
//
//        DM.ADOConnection.CommitTrans;
//      except
//        DM.ADOConnection.RollbackTrans;
//      end;
//      DM.cDS567.Close;
//      DM.cDS567.Open;
//      SetButtonStatus(DBGridEh1.DataSource.DataSet.State in [dsEdit,dsInsert]);
//    finally
//      DM.ADOQuery1.Close;
//    end;
//  end;
end;

procedure TfrmPause.DataSource1StateChange(Sender: TObject);
begin
  if DataSource1.DataSet.State in [dsEdit,dsInsert] then
  begin
      tbSave .Enabled   :=True ;
      tbCancel.Enabled  :=True ;
      tbDelete.Enabled:=False;
  end
  else
  begin
      tbSave .Enabled   :=False ;
      tbCancel.Enabled  :=False ;
      tbDelete.Enabled:=True;
  end;
 // SetButtonStatus(DBGridEh1.DataSource.DataSet.State in [dsEdit,dsInsert]);;
end;

procedure TfrmPause.Button1Click(Sender: TObject);
begin
//  with dm do
//  if (cDS567STATUS.AsInteger in [2,3]) then
//  begin
//    with qry577 do
//    begin
//      if  State   <>dsInsert  then
//        Append;
//      FieldByName('rkey567').Value           := DM.cDS567RKEY.Value;
//      FieldByName('stop_begin_date').Value   := GetSmallDatetime(DM.ADOQuery1);
//    end;
//  end;
end;

procedure TfrmPause.Button2Click(Sender: TObject);
var
  s:Integer;
begin
//  with DM. cds842 do
//  begin
//    First;
//    while not Eof do
//    begin
//      if FieldByName('Status').AsInteger =6  then
//      begin
//        s:= messagedlg('维修人员的状态也是暂停，要自动同步暂停结束吗？',mtconfirmation,[mbyes,mbno,mbcancel],0);
//        if  s=mrYes then
//          begin
//          Form1.b_Processing:=True    ;
//          Break;
//          end
//        else
//        if s=mrNo then
//          begin
//          Form1.b_Processing:=False;
//          Break;
//          end
//        else
//        if s=mrCancel then
//          begin
//          Exit;
//          end          ;
//      end;
//      Next;
//    end;
//  end;
//
//  with DM.qry577 do
//  begin
//    Last;
//    if  FieldByName('stop_end_date').IsNull then
//    begin
//      if  State   <>dsEdit  then
//        Edit;
//      FieldByName('stop_end_date').Value   := GetSmallDatetime(DM.ADOQuery1);;
//      Post;
//    end;
//  end;
end;

procedure TfrmPause.FormCreate(Sender: TObject);
begin
  with DM.qry577 do
  begin
    FieldByName('stop_begin_date').DisplayLabel:='暂停开始时间';
    FieldByName('stop_begin_date').DisplayWidth:=18;
    FieldByName('stop_end_date').DisplayLabel:='暂停结束时间';
    FieldByName('stop_end_date').DisplayWidth:=18;
    FieldByName('remark').DisplayLabel:='暂停原因说明';
    FieldByName('remark').DisplayWidth:=50;
    FieldByName('rkey567').Visible:=False;
  end;
end;

procedure TfrmPause.tbSaveClick(Sender: TObject);
begin
//  with DM.qry577 do
//  begin
//    if Active and (State in [dsEdit,dsInsert])then
//    Post;
//  end
end;

procedure TfrmPause.tbCancelClick(Sender: TObject);
begin
//  with DM.qry577 do
//  begin
//    if Active then
//    Cancel;
//  end
end;

procedure TfrmPause.FormClose(Sender: TObject; var Action: TCloseAction);
var
  s:integer;
begin
  with DM.qry577 do
  if Active then
  if  (State=dsInsert) or (State=dsEdit)then
  begin
     S:= messagedlg('数据还没有保存,你要保存吗?',mtconfirmation,[mbyes,mbno,mbcancel],0);
     if S = mryes  then
         Post
     else
     if S = mrcancel then
         abort
     else
     if s=mrNo then
         Cancel    ;
  end;
end;

procedure TfrmPause.FormShow(Sender: TObject);
begin                         //2  '已受理'  3  '已完工'8  '验收退回'
  if (vRights in [4])and(DM.cds567STATUS.AsInteger in [2,3,8]) then
    begin
    DBGridEh1.FieldColumns['stop_begin_date'].ReadOnly:=False;
    DBGridEh1.FieldColumns['stop_end_date']  .ReadOnly:=False;
    end
  else
//  if vRights in [2] then
    begin
    DBGridEh1.FieldColumns['stop_begin_date'].ReadOnly:=True;
    DBGridEh1.FieldColumns['stop_end_date']  .ReadOnly:=True;
    end
//  else
//  if vRights in [1,3] then
//    begin
//    DBGridEh1.ReadOnly:=True;
//    Button1.Enabled:=False;
//    Button2.Enabled:=False;
//    end ;
//  SetButtonStatus;
end;

procedure TfrmPause.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=vk_down then                //如果光标键向下
  if (DM.qry577.RecNo=DM.qry577.RecordCount)or(DM.qry577.IsEmpty) then  //如果已是最后一行。
  Key:=0;
end;

end.
