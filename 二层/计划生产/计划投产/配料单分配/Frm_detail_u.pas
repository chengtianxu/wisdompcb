unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls,
  ComCtrls, DBGridEh, Menus, DB, ADODB, DBCtrlsEh;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    BtnSave: TBitBtn;
    Grd1: TDBGridEh;
    Grd2: TDBGridEh;
    Splitter1: TSplitter;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    Label1: TLabel;
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure Grd1DblClick(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FQty,FtotQty:real;

  public
    procedure initd;
  end;

implementation
  uses DM_u,Frm_Out_u,common;

{$R *.dfm}

procedure TFrm_detail.initd;
begin
  FQty:=DM.ADO468QUAN_BOM.AsFloat-DM.ADO468QUAN_ISSUED.AsFloat;
  FtotQty:=0;
  Label1.Caption:='需求数：'+floattostr(FQty);
  DM.ADO475_1.Open;
  DM.ADO22.Close;
  DM.ADO22.Parameters[0].Value:=DM.ADO468rkey17.Value;
  DM.ADO22.Open;
end;

procedure TFrm_detail.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:=not DM.ADO22.IsEmpty ;  //and (FtotQty<FQty)
end;

procedure TFrm_detail.PopupMenu2Popup(Sender: TObject);
begin
  N2.Enabled:=not DM.ADO475_1.IsEmpty;
end;

procedure TFrm_detail.BitBtn9Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_detail.N1Click(Sender: TObject);
var
  rkey22:string;
  //dt: TDateTime;
 // BK: TBookmark;
begin

  if FtotQty=FQty then
  begin
    showmessage('需求已分配完成,不能多分配!');
    exit;
  end;
  if DM.FCurrDate>DM.ADO22EXPIRE_DATE.Value then
  begin
    showmessage('此材料已过有效期,不能分配,请检查此批原材料质量!');
    exit;
  end;

  if DM.ADO22.FieldByName('是否检验OK').AsString='否'  then
  begin
   ShowMessage('该批料未检验或检验不合格不能发料!');
   exit;
  end;

  if  (DM.ADO468.FieldByName('rk23').Value>0) and (DM.ADO22.FieldByName('supp_ptr').AsString<>DM.ADO468.FieldByName('rk23').AsString ) then
  begin
   ShowMessage('没有对应供应商的物料！');
   exit;
  end;

//   BK:= DM.ADO22.GetBookmark;
//  dt:=DM.ADO22EXPIRE_DATE.Value;
//  dm.ADO22.First;
//  while not dm.ADO22.Eof do
//  begin
//    if  DM.ADO22EXPIRE_DATE.Value<dt  then
//    begin
//    if messagedlg('还有更早入库的料，你确定要继续吗?',mtconfirmation,[mbyes,mbno],1)=mrNO then  Exit ;
//     Break;
//    end;
//    dm.ADO22.Next;
//  end;
//  DM.ADO22.GotoBookmark(bk);


  rkey22:='(0,';
  dm.ADO475_1.First;
  while not dm.ADO475_1.Eof do
  begin
    rkey22:=rkey22+dm.ADO475_1rkey22.AsString+',';
    dm.ADO475_1.Next;
  end;
  rkey22:=Copy(rkey22,1,Length(rkey22)-1)+')';

  with DM.tmp do
  begin
    close;
    sql.Text:='select data0022.rkey from data0022 inner join data0456 '+
             'on dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY '+
             'where (data0022.INVENTORY_PTR='+dm.ADO22INVENTORY_PTR.AsString+')'+
             ' and (Data0456.SUPP_PTR='+dm.ADO22supp_ptr.AsString+')'+
             ' and (Data0022.QUAN_ON_HAND - Data0022.QUAN_TO_BE_STOCKED > 0) '+
             ' and (Data0022.EXPIRE_DATE<'+quotedstr(dm.ADO22EXPIRE_DATE.AsString)+')'+
             ' and (Data0022.EXPIRE_DATE>='+quotedstr(DateToStr(dm.FCurrDate))+')'+
             ' and data0022.rkey not in'+rkey22;
    open;
   if not IsEmpty then
   begin
    showmessage('此材料同一供应商有效期在当前批次前，请先分配!');
    exit;
   end;
  end;

  with TFrm_out.Create(nil) do
  try
    Edit1.Text:=DM.ADO22ValQty.AsString;
    Edit2.Text:=floattostr(FQty-FtotQty);
    if DM.ADO22ValQty.AsFloat>=FQty-FtotQty then
      edit5.Text:=Edit2.Text
    else
      edit5.Text:=Edit1.Text;
    if showmodal=mrok then
    begin
      DM.ADO22.Edit;
      DM.ADO22QUAN_TO_BE_STOCKED.AsFloat:=DM.ADO22QUAN_TO_BE_STOCKED.AsFloat+strtofloat(Edit5.Text);
      DM.ADO22.Post;

      DM.ADO475_1.Append;
      DM.ADO475_1rkey468.Value:=DM.ADO468rkey.asinteger;
      DM.ADO475_1rkey22.Value:=DM.ADO22RKEY.asinteger;
      DM.ADO475_1quan_alloc.Value:=strtofloat(Edit5.Text);
      DM.ADO475_1alloc_datetime.Value:=DM.FCurrDate;
      dm.ADO475_1alloc_userptr.Value:=StrToInt(common.user_ptr);
      dm.ADO475_1GRN_NUMBER.Value:=dm.ADO22GRN_NUMBER.Value;
      dm.ADO475_1CREATE_DATE.Value:=dm.ADO22CREATE_DATE.Value;
      DM.ADO475_1.post;

      DM.ADO22.Filtered:=false;   //触发过滤
      DM.ADO22.Filtered:=true;
      FtotQty:=FtotQty+strtofloat(Edit5.Text);
    end;
  finally
    free;
  end;
end;

procedure TFrm_detail.N2Click(Sender: TObject);
var iQty :real;
    rkey22:integer;
begin
  iQty:=DM.ADO475_1quan_alloc.Value;
  FtotQty:=FtotQty-iQty;
  rkey22:=DM.ADO475_1rkey22.Value;

  DM.ADO475_1.Delete;
  DM.ADO22.Filtered:=false;
  DM.ADO22.Filtered:=true;

  if DM.ADO22.Locate('rkey',rkey22,[]) then
  begin
      DM.ADO22.Edit;
      DM.ADO22QUAN_TO_BE_STOCKED.AsFloat:=DM.ADO22QUAN_TO_BE_STOCKED.AsFloat-iQty;
      DM.ADO22.Post;
  end
  else
  begin
    showmessage('出现错误...');
    close;
  end;
end;

procedure TFrm_detail.BtnSaveClick(Sender: TObject);
begin
  if DM.ADO475_1.IsEmpty then
  begin
    showmessage('没有记录要保存...');
    exit;
  end;
  DM.ADOCon.BeginTrans;
  try
    DM.ADO22.UpdateBatch(arAll);

    DM.ADO475_1.First;
    while not DM.ADO475_1.Eof do
    begin
      DM.tmp.Close;
      DM.tmp.SQL.Text:='insert into data0475 values('+DM.ADO475_1rkey468.AsString+','+
                       DM.ADO475_1RKEY22.AsString+','+DM.ADO475_1quan_alloc.AsString+','+
                       dm.ADO475_1alloc_userptr.AsString+','+quotedstr(dm.ADO475_1alloc_datetime.AsString)+')';
      DM.tmp.ExecSQL;
      DM.ADO475_1.Next;
    end;

    DM.ADO468.Edit;
    DM.ADO468quan_alloc.Value:=FtotQty;
    DM.ADO468.Post;

    DM.tmp.SQL.Text:='update data0017 set QUAN_assign= QUAN_assign+'+floattostr(FtotQty)+' where rkey='+DM.ADO468rkey17.AsString;
    DM.tmp.ExecSQL;
    DM.ADOCon.CommitTrans;

    showmessage('已成功分配!');
    modalresult:=mrok;
  except
      on  E: Exception do
      begin
        DM.ADOCon.RollbackTrans;
        DM.Fok:=false;
        ShowMessage(e.message);
      end;
  end;

end;

procedure TFrm_detail.Grd1DblClick(Sender: TObject);
begin

  if not DM.ADO22.IsEmpty  then N1Click(nil);   //and (FtotQty<FQty)
end;

procedure TFrm_detail.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO22.SQL.Text);
end;

end.
