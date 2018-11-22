unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls,
  ComCtrls, DBGridEh, Menus, DB, ADODB;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    MEdtReqNo: TMaskEdit;
    EdtFac: TEdit;
    EdtAud: TEdit;
    EdtBug: TEdit;
    SpYear: TSpinEdit;
    SpMonth: TSpinEdit;
    DpReqDate: TDateTimePicker;
    Grd2: TDBGridEh;
    Grd3: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    EdtDept: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    Label7: TLabel;
    EdtUser: TEdit;
    Label9: TLabel;
    EdtPhone: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Grd2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private

  public
    Ftag:integer;
    procedure init;
  end;

var
  Frm_detail: TFrm_detail;

implementation
  uses DM_u,common,Frm_note_u,Frm_DetailEdit_u,Frm_DetailEdit1_u;

{$R *.dfm}

{ TFrm_detail }

procedure TFrm_detail.init;
begin
  if DM.AQ68auth_flag.Value<>'Y' then
  begin
    BitBtn1.Enabled:=false;
    BitBtn3.Enabled:=false;
  end;

  Grd2.Visible:=DM.AQ68flag.Value='S';
  Grd3.Visible:=not Grd2.Visible;
  MEdtReqNo.Text:=DM.AQ68po_req_number.Value;
  EdtFac.Enabled:=false;
  EdtFac.Text:=DM.AQ68warehouse_code.value;
  Label5.Caption:=DM.AQ68abbr_name.Value;
  EdtAud.Text:=DM.AQ68code94.value;
  Label6.Caption:=DM.AQ68PURCHASE_APPROV_DESC.value;
  EdtBug.Text:=DM.AQ68code362.value;
  Label6.Caption:=DM.AQ68DESCRIPTION.value;
  EdtDept.Text:=DM.AQ68department_name.Value;
  DpReqDate.Date:=DM.AQ68req_date.Value;
  SpYear.Value:=DM.AQ68v_year.Value;
  SpMonth.Value:=DM.AQ68v_month.Value;

  EdtUser.Text:=DM.AQ68user_name.value;
  EdtPhone.Text:=DM.AQ68user_phone.value;
end;

procedure TFrm_detail.BitBtn2Click(Sender: TObject);
begin
  with TFrm_note.Create(nil) do
  try
    caption:='请购记事';
    BitBtn1.Enabled:=false;
    DM.ADO11.close;
    DM.ADO11.SQL.Text:='select rkey,file_pointer,source_type,note_pad_line_1  from data0011 '+
                       'where source_type=68 and file_pointer='+DM.AQ68rkey.AsString;
    DM.ADO11.Open;
    showmodal;
  finally
    free;
  end;
end;

procedure TFrm_detail.N1Click(Sender: TObject);
begin
  if  Grd2.Visible then
  begin
    Frm_DetailEdit:=TFrm_DetailEdit.Create(nil);
    try
      with Frm_DetailEdit do
      begin
        Ftag:=TComponent(Sender).Tag;
        Edit1.Text:=self.Label5.Caption;
        initData;
        BtSave.Enabled:=false;
        BtCan.Caption:='关闭';
        EdtMat.visible:=false;
        GroupBox2.Enabled:=false;
        dbchkIF_urgency.Enabled:= False;
        showmodal;
      end;
    finally
      Frm_DetailEdit.free;
    end;
  end else begin
    Frm_DetailEdit1:=TFrm_DetailEdit1.Create(nil);
    try
      with Frm_DetailEdit1 do
      begin
        Ftag:=TComponent(Sender).Tag;
        initData;
        BtSave.Enabled:=false;
        BtCan.Caption:='关闭';
        BitBtn4.Enabled:=false;
        Edit1.visible:=false;
        showmodal;
      end;
    finally
      Frm_DetailEdit1.free;
    end;
  end;
end;

procedure TFrm_detail.PopupMenu1Popup(Sender: TObject);
begin
   N5.Enabled:=((DM.AQ69.RecordCount>0) or (DM.AQ204.RecordCount>0));
end;

procedure TFrm_detail.BitBtn9Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_detail.BitBtn3Click(Sender: TObject);
begin
   if DM.AQ68auth_flag.Value='Y' then
   begin
     DM.ADOCon.BeginTrans;
     try
       DM.tmp.Close;
       DM.tmp.SQL.Text:='update data0276 set auth_flag=''N'',auth_date=getdate() where rkey='+DM.AQ68rkey276.AsString;
       DM.tmp.ExecSQL;

       DM.tmp.Close;
       DM.tmp.SQL.Text:='update data0068 set edited_date=getdate() where rkey='+DM.AQ68rkey.AsString+' and status=1';
       if DM.tmp.ExecSQL=0 then
       begin
         DM.ADOCon.RollbackTrans;
         showmessage(DM.AQ68po_req_number.Value+'请购单状态发生改变导致审核失败!');
         exit;
       end;

       DM.tmp.Close;
       DM.tmp.SQL.Text:='update data0276 set auth_flag=''Y'',auth_date=null where rkey=('+
                        'select top 1 rkey from data0276 where purchase_ptr='+DM.AQ68rkey.AsString+
                                        ' and ranking>'+DM.AQ68ranking.AsString+' order by ranking asc)';
       if DM.tmp.ExecSQL=0 then  //为最后一个审核
       begin
         DM.tmp.SQL.Text:='update data0068 set status=3 where rkey='+DM.AQ68rkey.AsString;
         DM.tmp.ExecSQL;
       end;
       DM.ADOCon.CommitTrans;
       modalresult:=mrok;
     except
       DM.ADOCon.RollbackTrans;
       showmessage('取消审核发生错误而失败...');
     end;
   end else
     showmessage('因审核顺序不对而不能审核!');
end;

procedure TFrm_detail.BitBtn1Click(Sender: TObject);
begin
  try
     with TFrm_note.Create(nil) do
     try
        caption:='退回请购记事';
        DM.ADO11.close;
        DM.ADO11.SQL.Text:='select *  from data0011 '+
                           'where source_type=1068 and file_pointer='+DM.AQ68rkey.AsString;
        DM.ADO11.Open;
        if DM.ADO11.IsEmpty then
        begin
          DM.ADO11.Append;
          DM.ADO11.FieldByName('file_pointer').AsInteger:=DM.AQ68rkey.AsInteger;
          DM.ADO11.FieldByName('source_type').AsInteger:=1068;
        end;
        showmodal;
        if DM.ADO11.State in [dsEdit, dsInsert] then DM.ADO11.Post;
     finally
        free;
     end;
    DM.ADOCon.BeginTrans;
    DM.ADO11.UpdateBatch(arAll);
    DM.tmp.Close;
    DM.tmp.SQL.Text:='update data0068 set status=4 where rkey='+DM.AQ68rkey.AsString+' and status=1';
    if DM.tmp.ExecSQL=0 then
    begin
      DM.ADOCon.RollbackTrans;
      showmessage(DM.AQ68po_req_number.Value+'请购单状态发生改变导致退回失败!');
      modalresult:=mrok;
      exit;
    end;

    DM.ADOCon.CommitTrans;
    showmessage('退回操作成功!');
    modalresult:=mrok;
  except
    DM.ADOCon.RollbackTrans;
    messagedlg('退回操作发生错误!',mtinformation,[mbok],0);
  end;
end;

procedure TFrm_detail.Grd2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if dm.AQ69CRITICAL_MATL.Value='是' then
  Grd2.Canvas.Font.Color := clRed;

  Grd2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
