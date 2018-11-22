unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DB, DBTables, Mask,
  DBCtrls, Menus, ADODB, ExtCtrls, DBGridEh;

type
  TFrm_Main = class(TForm)
    Bar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    new: TMenuItem;
    edit: TMenuItem;
    copydate: TMenuItem;
    delete: TMenuItem;
    N1: TMenuItem;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    BtnClose: TBitBtn;
    BtnRefresh: TBitBtn;
    BtnExportToExcel: TBitBtn;
    BtnQuery: TBitBtn;
    Lab_Fielter: TLabel;
    Edt_Fielter: TEdit;
    BitFieldsVisable: TBitBtn;
    PopupMenu2: TPopupMenu;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox5: TCheckBox;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure newClick(Sender: TObject);
    procedure copydateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure Edt_FielterChange(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitFieldsVisableClick(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn : TColumnEh;
    field_name : string;
    FSql,FSqlText,FStrStatus : string;
    procedure item_click(sender: TObject);
  public
    { Public declarations }
  end;

const
  ReviewDays=90;
var
  Frm_Main: TFrm_Main;

implementation

uses editprodcode,common, demo, category, QuerySet;

{$R *.dfm}


procedure TFrm_Main.BitBtn1Click(Sender: TObject);
begin
  Frm_Category := TFrm_Category.Create(Self);
  Frm_Category.ShowModal;
end;

procedure TFrm_Main.editClick(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  Frm_ProdCode := TFrm_ProdCode.Create(application);
  try
    DM.ADO08.Close;
    DM.ADO08.SQL.Text := FSql + ' and data0008.rkey=' + DM.ADS08RKEY.AsString;
    DM.ADO08.Open;
    Frm_ProdCode.F_Status := 1;
    if Frm_ProdCode.ShowModal=mrok then
    begin
      BtnRefreshClick(Sender);
      ShowMsg('编辑操作成功!',1);
    end;
  finally
    Frm_ProdCode.Free;
  end;
end;

procedure TFrm_Main.newClick(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  Frm_ProdCode := TFrm_ProdCode.Create(application);
  try
    DM.ADO08.Close;
    DM.ADO08.SQL.Text := FSql ;
    DM.ADO08.Open;
    Frm_ProdCode.F_Status := 0;
    DM.ADO08.Append;
    DM.ADO08.FieldValues['lead_time']:=0;
    DM.ADO08.FieldValues['opt_lot_size']:=0;
    DM.ADO08.FieldValues['MAX_DAYS_EARLY_BUILD']:=0;
    DM.ADO08.FieldValues['PROD_SEEDVALUE']:='1';
    DM.ADO08.FieldValues['PROD_INCREMENTBY']:=1;
    DM.ADO08.FieldValues['REVIEW_DAYS']:=ReviewDays;
    DM.ADO08.FieldValues['active']:=1;
    DM.ADO08.Post;
    Frm_ProdCode.FReviewDays := ReviewDays;
    if Frm_ProdCode.ShowModal=mrok then
    begin
      BtnRefreshClick(Sender);
      ShowMsg('新增操作成功!',1);
    end;
  finally
    Frm_ProdCode.Free;
  end;
end;

procedure TFrm_Main.copydateClick(Sender: TObject);
type
 a=array[0..31] of variant;
var
 v_recode:a;
 i:word;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  try
    DM.ADO08.Close;
    DM.ADO08.SQL.Text := FSql + ' and data0008.rkey=' + DM.ADS08RKEY.AsString;
    DM.ADO08.Open;

    for i:=3 to 31 do
    begin
      v_recode[i] := DM.ADO08.Fields[i].Value;
//      DM.ADO08.FieldValues[DM.ADO08.Fields[i].FieldName] := DM.ADS08.FieldValues[DM.ADO08.Fields[i].FieldName];
    end;
    DM.ADO08.Append;
    for i:=3 to 31 do
    begin
      DM.ADO08.FieldValues[DM.ADO08.Fields[i].FieldName] := v_recode[i];
    end;
    DM.ADO08.Post;
    Frm_ProdCode := TFrm_ProdCode.Create(Application);
    Frm_ProdCode.F_Status := 2;
    if Frm_ProdCode.ShowModal=mrok then
    begin
      BtnRefreshClick(Sender);
      ShowMsg('新增操作成功!',1);
    end;
  finally
    Frm_ProdCode.Free;
  end;
// for i:=0 to 28 do
//  v_recode[i]:=adotable1.Fields[i+2].Value;
//  adotable1.Append;
//  for i:=0 to 28 do
//  adotable1.fieldvalues[adotable1.Fields[i+2].FieldName]:=v_recode[i];
// self.Hide;
// form2:=tform2.Create(application);
// form2.ShowModal;
// form2.Free;
end;

procedure TFrm_Main.FormCreate(Sender: TObject);
begin
  if not App_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
    exit;
  end;
  self.Caption:=application.Title;
//  OldGridWnd := DBGrid1.WindowProc;
//  DBGrid1.WindowProc := NewGridWnd;

end;

procedure TFrm_Main.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to dbgrideh1.FieldCount - 1 do
    if dbgrideh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbgrideh1.Columns[i].Visible := true;
      break;
    end;
  end
  else
  begin
    for i := 0 to dbgrideh1.FieldCount - 1 do
    if dbgrideh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbgrideh1.Columns[i].Visible := false;
      break;
    end;
  end;

end;

procedure TFrm_Main.FormShow(Sender: TObject);
var
  i:Integer;
  item:TMenuItem;
begin
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  FSql := DM.ADS08.CommandText;
  for i:=1 to DBGrideh1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := DBGrideh1.Columns[i-1].Title.Caption ;
    item.Checked := DBGrideh1.Columns[i-1].Visible ;

    item.OnClick := item_click ;

    self.PopupMenu2.Items.Add(item) ;
  end;
  FStrStatus := ' and data0008.active in (1)';
  DM.ADS08.Close;
  DM.ADS08.CommandText := FSql + FStrStatus;
  DM.ADS08.Open;
  Bar1.SimpleText := '当前记录行:'+IntToStr(DM.ADS08.RecNo)+'/总记录数:'+ IntToStr(DM.ADS08.RecordCount);
//if Adoconnection1.Connected then
// begin
//  if not self.ADOTable1.Active then
//  begin
//  adotable1.Open;
//  adotable07.Open;
//  end;
// end;
end;

procedure TFrm_Main.PopupMenu1Popup(Sender: TObject);
begin
 if DM.ADS08.IsEmpty then
  begin
   edit.Enabled:=false;
   copydate.Enabled:=false;
   delete.Enabled:=false;
  end
 else
  begin
   edit.Enabled:=true;
   copydate.Enabled:=true;
   delete.Enabled:=true;
  end;
end;

procedure TFrm_Main.BtnCloseClick(Sender: TObject);
begin
  application.Terminate;
end;

procedure TFrm_Main.N1Click(Sender: TObject);
begin
  if not DM.ADS08.IsEmpty then
  begin
  //adotable1.Edit;
  //  hide;
    Frm_ProdCode :=tFrm_ProdCode.Create(application);
    DM.ADO08.Close;
    DM.ADO08.SQL.Text := FSql + ' and data0008.rkey=' + DM.ADS08RKEY.AsString;
    DM.ADO08.Open;
    Frm_ProdCode.F_Status := 3;
    Frm_ProdCode.BitBtn1.Enabled:=false;
    Frm_ProdCode.DBEdit12.ReadOnly:=true;
    Frm_ProdCode.DBEdit13.ReadOnly:=true;
    Frm_ProdCode.BitBtn3.Enabled:=false;
    Frm_ProdCode.DBEdit7.Enabled:=false;
    Frm_ProdCode.DBEdit8.Enabled:=false;
    Frm_ProdCode.DBEdit9.Enabled:=false;
    Frm_ProdCode.DBEdit20.Enabled:=false;
    Frm_ProdCode.BitBtn6.Enabled:=false;
    Frm_ProdCode.DBRadioGroup1.Enabled:=false;
    Frm_ProdCode.DBEdit1.Enabled:=false;
    Frm_ProdCode.DBEdit10.Enabled:=false;
    Frm_ProdCode.Edit4.Enabled:=false;
    Frm_ProdCode.DBEdit16.Enabled:=false;
    Frm_ProdCode.DBEdit18.Enabled:=false;
    Frm_ProdCode.DBEdit19.Enabled:=false;
    Frm_ProdCode.BitBtn4.Enabled:=false;
    Frm_ProdCode.BitBtn5.Enabled:=false;
    Frm_ProdCode.BitBtn7.Enabled:= False;
    Frm_ProdCode.ComboBox1.Enabled:= False;
    Frm_ProdCode.Edit1.Enabled:=false;
    Frm_ProdCode.Edit2.Enabled:=false;
//    Frm_ProdCode.DBEdit2.Enabled:=false;
//    Frm_ProdCode.DBEdit3.Enabled:=false;
//    Frm_ProdCode.DBEdit4.Enabled:=false;
//    Frm_ProdCode.DBEdit5.Enabled:=false;
//    Frm_ProdCode.DBEdit6.Enabled:=false;
    Frm_ProdCode.DBCheckBox1.Enabled:=false;
    Frm_ProdCode.DBCheckBox2.Enabled:=false;
    Frm_ProdCode.DBEdit21.Enabled:=False;


    //  DM.ADO08.LockType:=ltreadonly;  //只读模式
    Frm_ProdCode.ShowModal;
    //  DM.ADO08.LockType:=ltBatchOptimistic;
    Frm_ProdCode.Free;
  end;
end;

procedure TFrm_Main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (Column.Title.SortMarker= smDownEh) or (Column.Title.SortMarker = smNoneEh) then
  begin
    Column.Title.SortMarker := smUpEh;
    DM.ADS08.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    Column.Title.SortMarker := smDownEh;
    DM.ADS08.IndexFieldNames := Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>Column.FieldName) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    Lab_Fielter.Caption := Column.Title.Caption;
    Edt_Fielter.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clRed;
    PreColumn := Column;
    Edt_Fielter.Left := Lab_Fielter.Left + Lab_Fielter.Width + 5 ;
  end
  else
  Edt_Fielter.SetFocus;
end;

procedure TFrm_Main.BtnRefreshClick(Sender: TObject);
var
  rkey08:Integer;
begin
  rkey08 := DM.ADS08RKEY.Value;
  with DM.ADS08 do
  begin
    Close;
    Open;
  end;
  if rkey08 > 0 then
  DM.ADS08.Locate('rkey',rkey08,[]);

end;

procedure TFrm_Main.BtnExportToExcelClick(Sender: TObject);
begin
  if not dm.ADS08.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
    Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TFrm_Main.Edt_FielterChange(Sender: TObject);
begin
  if Trim(Edt_Fielter.Text)<>'' then
    DBGridEh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+ Trim(Edt_Fielter.Text)+'%'''
  else
    DBGridEh1.DataSource.DataSet.Filter :='';
end;

procedure TFrm_Main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
    ShowMessage(DM.ADS08.CommandText);
end;

procedure TFrm_Main.BitFieldsVisableClick(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_Main.deleteClick(Sender: TObject);
begin
  try
    if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
      messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
    else
    if MessageDlg('您确定要删除该产品类型?',mtConfirmation,[mbYes, mbNo],0) =mryes then
    begin
      with DM.ADOQuery1 do
      begin
        close;
        sql.Text:='delete data0008 where rkey='+dm.ADS08RKEY.AsString;

        if ExecSQL>0 then
        begin
         common.ShowMsg('删除操作成功！',1);
         self.BtnRefreshClick(Sender);
        end;
      end;

    end;
  except
      on E:Exception do
      begin
        MessageDlg(E.Message,mtError,[mbCancel],0);
        ShowMessage('该类别代码可能已经在使用，不能删除');
      end;
  end;

end;

procedure TFrm_Main.BtnQueryClick(Sender: TObject);
var
  i:integer;
begin
  if frmQuerySet.ShowModal=mrok then
  begin
    DM.ADS08.Close;
    DM.ADS08.CommandText := FSql;
    FSqlText :='';
    for i:=1 to frmQuerySet.SGrid1.RowCount-2 do
      FSqlText := FSqlText + frmQuerySet.SGrid1.Cells[2,i]+#13;
    dm.ADS08.CommandText := FSql+FstrStatus+FSqlText ;
    DM.ADS08.Open;
  end;

end;

procedure TFrm_Main.CheckBox5Click(Sender: TObject);
begin
  FstrStatus :='';
  if CheckBox1.Checked then
    FstrStatus := '1,';
  if CheckBox5.Checked then
    FstrStatus:=FStrStatus+'0,';

  if FstrStatus <> '' then
    FstrStatus := ' and isnull(Data0008.active,0) in ('+copy(FstrStatus,0,Length(FstrStatus)-1)+')'+#13
  else
    FstrStatus := ' and Data0008.active in (9)'+#13;

  With DM.ADS08 do
  begin
    Close;
    dm.ADS08.CommandText := FSql+FstrStatus+FSqlText;
    Open;
  end;
end;

procedure TFrm_Main.Label1Click(Sender: TObject);
begin
  ShowMessage('权限2,4能删除类别代码;权限4才能进行产品类别定义,手动修改类别代码和名称');
end;

end.
