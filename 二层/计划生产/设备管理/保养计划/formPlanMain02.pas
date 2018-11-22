unit formPlanMain02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SingleDataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  ppEndUsr, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, DB, DBClient, cds, Provider, ADODB,
  dxBar, cxClasses, ImgList, ActnList, Grids, DBGridEh, ToolWin, ComCtrls,
  cxPC, StdCtrls, RzPanel, ExtCtrls, dxStatusBar, Menus;

type
  TfrmPlanMain02 = class(TSingleDataSet_f)
    cdsMainRkey: TAutoIncField;
    cdsMainrkey831: TIntegerField;
    cdsMainstop_begin_date: TDateTimeField;
    cdsMainstop_end_date: TDateTimeField;
    cdsMainremark: TWideStringField;
    Button2: TButton;
    Button3: TButton;
    dtMainRkey: TAutoIncField;
    dtMainrkey831: TIntegerField;
    dtMainstop_begin_date: TDateTimeField;
    dtMainstop_end_date: TDateTimeField;
    dtMainremark: TWideStringField;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure RightsSetDataSetReadOnly;  override;
 //   function SaveBeforeCheck():Boolean;  override;
//    function SaveData():Boolean;         override;
 //   procedure SetButtonStatus;           override;
  public
    { Public declarations }
  end;

var
  frmPlanMain02: TfrmPlanMain02;

implementation

uses PublicFile, formPlanMain, DM_f;

{$R *.dfm}

procedure TfrmPlanMain02.RightsSetDataSetReadOnly;
begin
  cdsMain.ReadOnly:=True;
  DghMain.ReadOnly:=True;
end;
 {
procedure TfrmPlanMain02.SetButtonStatus;
begin
  if frmPlanMain.cdsMainRKEY832.AsInteger=3  then   //3 =执行中
  begin
    Button2.Enabled:=True ;
    Button3.Enabled:=False;
  end
  else
  if frmPlanMain.cdsMainRKEY832.AsInteger=6  then
  begin
    Button2.Enabled:=False ;
    Button3.Enabled:=True;
  end
end;

function TfrmPlanMain02.SaveBeforeCheck():Boolean;
var
  strMsg:string;
begin
  Result:=True;
  with cdsMain do
  begin
    if State in [dsEdit ,dsInsert] then
    Post;
//    if FieldByName('number').IsNull then //申领单号
//      strMsg:=strMsg+'字段：“'+FieldByName('number').DisplayLabel+'”的值不能为空！！！'+#13;
  end;

  if strMsg<>'' then
  begin
    MsgError(Copy(strMsg,0,Length(strMsg)-1));
    Result:=False;
  end;
end; }
{
function TfrmPlanMain02.SaveData():Boolean;
var
  isPause:Boolean;   //是暂停
  NowDate:TDateTime;
  b_Processing:Integer;
begin                       //如果有雇员记录，全部暂停。
  Result:=True;
//  with cdsMain do
  begin
//    if cdsMain.ChangeCount >0 then
    if SaveBeforeCheck then
    begin
      DM.ADOConnection1.BeginTrans;
      if Self.cdsMain.State in [dsEdit,dsInsert] then
        Self.cdsMain.Post;
      isPause:=False;
      b_Processing:=0;
      with  cdsRead do
      begin
        data:=(cdsMain.Data);
        while not Eof do
        begin
          if fieldByName('stop_end_date').isnull then    //如果当前记录中，只要有一行记录的stop_end_date为空 ，
          begin
            isPause:=True;
            Break;
          end;
          Next;
        end;
        cdsRead.Close;
      end;

      frmPlanMain.cdsMain.Edit;
      NowDate:=GetDataBaseSmallDate(DM.cdsRead);

      if isPause=True then     //如果是暂停
      begin
        frmPlanMain.cdsMainRKEY832.AsInteger:=6 ;               //修改状态为已暂停
        with  frmPlanMain.cdsChild   do
        begin
          try
            DisableControls ;
            First;
            while not Eof do
            begin
              if FieldByName('Status').AsInteger=3 then    //如果状态是执行中
              begin
               // with cdsRead do
                begin
                  DM.cdsRead.Close;                                                     //FormatDateTime('yyyy-m-d h:n:s',NowDate)
                  DM.cdsRead.CommandText:='insert into DATA0849([Work_ptr],[stop_begin_date],[remark]) '
                  +' values('+FieldByName('rkey').AsString+','+QuotedStr(FormatDateTime('yyyy-m-d h:n:s',NowDate))+','
                  +QuotedStr(cdsMainremark.AsString)+')';

                  DM.cdsRead.Execute;
                end;
                Edit;
                FieldByName('Status').Value:=6;     //将状态改为“已暂停 ”     6	已暂停
                Post;
                if  ApplyUpdates(0)<> 0 then
                DM.ADOConnection1.RollbackTrans;
              end;
              Next;
            end;
          finally
            EnableControls;
          end;
        end;
      end
      else
      begin
        frmPlanMain.cdsMainRKEY832.AsInteger:=3;               //修改状态为执行中
//        with  frmPlanMain.cdsChild   do
//        begin
//          try
//            DisableControls ;
//            First;
//            while not Eof do
//            begin
//              if FieldByName('Status').AsInteger=6 then
//              begin
//                if b_Processing=0 then
//                if messagedlg('维修人员的状态也是暂停，要自动同步暂停结束吗？',mtconfirmation,[mbyes,mbno],0)=mrYes then
//                  b_Processing:=1
//                else
//                  b_Processing:=2;
//                if b_Processing=1 then   //只有用户在点击需要同步处理维修人员的暂停记录时，才执行下列代码。
//                begin       ?
//                  //with cdsRead do
//                  begin
//                    DM.cdsRead.Close;
//                    DM.cdsRead.CommandText:='update DATA0849 set [stop_end_date]= '+QuotedStr(FormatDateTime('yyyy-m-d h:n:s',NowDate))
//                    +' where Work_ptr=' +FieldByName('rkey').AsString
//                    +' and [stop_end_date] is null ';
//                   // ShowMessage(SQL.Text);
//                    DM.cdsRead.Execute;
//                  end;
//
//                 // with cdsRead do
//                  begin
//                    DM.cdsRead.Close;
//                    DM.cdsRead.CommandText:='select isnull(cast(sum(datediff(minute,[stop_begin_date],[stop_end_date]))as dec(10,2))/60,0)'
//                    +' from DATA0849 where Work_ptr=' +FieldByName('rkey').AsString;
//                    DM.cdsRead.Open;
//                  end;
//                  Edit;
//                  FieldByName('Status').Value:=3;     //将状态改为“执行中 ”     3	执行中
//                  FieldByName('TimeCons').Value := cdsRead.Fields[0].Value;  //暂停时间
//                  Post;
//                  DM.cdsRead.Close;
//                  if  ApplyUpdates(0)<> 0 then
//                  DM.ADOConnection1.RollbackTrans;
//                end;
//              end;
//              Next;
//            end;
//          finally
//            EnableControls;
//          end;
//        end;
      end;
      frmPlanMain.cdsMain.Post;

//      with  frmPlanMain  do
//      begin
//        cdsMain.Edit;
// //       if (DtMainstop_end_date.IsNull)or(DtMainstop_end_date.AsString='') then  //如果暂停结束时间=''
////        begin
////          if cdsMainRKEY832.AsInteger=3 then         //如果状态是执行中
////            cdsMainRKEY832.AsInteger:=6                //修改状态为已暂停
////          else
////          if cdsMainRKEY832.AsInteger=6 then     //如果状态是已暂停
////            cdsMainRKEY832.AsInteger:=3;           //修改状态为执行中
////        end;
//        cdsMain.Post;
//      end;
      if frmPlanMain.cdsMain.ApplyUpdates(0)=0 then
      begin
        if cdsMain.ApplyUpdates(0)=0 then
        begin
          DM.ADOConnection1.CommitTrans;
          dsMainStateChange(dsMain);
          frmPlanMain.dsMainStateChange(dsMain);
          frmPlanMain.SetButtonStatus;
          Self.SetButtonStatus;
          dxStatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(cdsMain.RecNo)+'/总记录数:'+ IntToStr(cdsMain.RecordCount);
          //Abort;
        end
        else
        begin
          DM.ADOConnection1.RollbackTrans;
          Result:=False;
        end ;
      end
      else
      begin
        DM.ADOConnection1.RollbackTrans;
        Result:=False;
      end;
    end;

  end;
end;      }

procedure TfrmPlanMain02.Button2Click(Sender: TObject);
begin
  inherited;
  if (frmPlanMain.cdsMainRKEY832.AsInteger=3) then
  begin
    with cdsMain do
    begin
      if  State   <>dsInsert  then
        Append;
      FieldByName('rkey831').Value           := frmPlanMain. cdsMainRkey.Value;
      FieldByName('stop_begin_date').Value   := GetDataBaseDate(cdsRead,1);
 //     Post;
    end;
  end;
end;

procedure TfrmPlanMain02.Button3Click(Sender: TObject);
begin
  inherited;
  with cdsMain do
  begin
    Last;
    if  FieldByName('stop_end_date').IsNull then
    begin
      if  State   <>dsEdit  then
        Edit;
      FieldByName('stop_end_date').Value   := GetDataBaseDate(cdsRead,1);
      Post;
    end;
  end;
end;

procedure TfrmPlanMain02.FormShow(Sender: TObject);
begin
  inherited;
//  SetButtonStatus;
end;

procedure TfrmPlanMain02.FormCreate(Sender: TObject);
begin

  inherited;
//  cdsMain.ReadOnly:=True;
//  DghMain.ReadOnly:=True;
end;

end.
