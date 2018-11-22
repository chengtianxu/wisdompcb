unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGridEh, ExtCtrls, Menus;

type
  Tfrm_Main = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    StatusBar1: TStatusBar;
    BitClose: TBitBtn;
    BitRefresh: TBitBtn;
    BtnExportToExcel: TBitBtn;
    BitQuery: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure BitCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure BitRefreshClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BitQueryClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    PreColumn:TColumnEh;
    sql_text,ssql:string;
    
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Main: Tfrm_Main;

implementation



uses damo,DB,common, QuerySet, information;

{$R *.dfm}

procedure Tfrm_Main.BitCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrm_Main.FormCreate(Sender: TObject);
begin
  if not App_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
    exit;
  end;
  self.Caption:=application.Title;
//  rkey73:='2551';
//  user_ptr := '3054';
//  vprev := '4';
end;

//procedure Tfrm_Main.item_click(sender: TObject);
//var
//  i:byte;
//begin
//  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
//  if (sender as tmenuItem).Checked then
//  begin
//    for i := 0 to dbgrideh1.FieldCount - 1 do
//    if dbgrideh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
//    begin
//      dbgrideh1.Columns[i].Visible := true;
//      break;
//    end;
//  end
//  else
//  begin
//    for i := 0 to dbgrideh1.FieldCount - 1 do
//    if dbgrideh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
//    begin
//      dbgrideh1.Columns[i].Visible := false;
//      break;
//    end;
//  end;
//
//end;

procedure Tfrm_Main.FormShow(Sender: TObject);
begin
  PreColumn := DBGridEh1.Columns[0];

  DM.ADS834.Close;
  if (StrToInt(vprev) = 4) then
  begin
    DM.ADS834.CommandText :=DM.ADS834.CommandText;
  end
  else
  begin
    DM.ADS834.CommandText :=DM.ADS834.CommandText+' and data0834.User_ptr='+rkey73;
  end;
  sql_text:=DM.ADS834.CommandText;
  DM.ADS834.Open;
  StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DM.ADS834.RecNo)+'/总记录数:'+ IntToStr(DM.ADS834.RecordCount);
  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select EMPLOYEE_PTR,USER_FULL_NAME,USER_LOGIN_NAME from data0073 where  rkey='+rkey73;
    Open;
    StatusBar1.Panels[1].Text:='用户名：'+trim(FieldValues['USER_FULL_NAME'])+' ('+trim(FieldValues['USER_LOGIN_NAME'])+')';
  end;

end;

procedure Tfrm_Main.BtnExportToExcelClick(Sender: TObject);
begin
  if not dm.ADS834.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure Tfrm_Main.BitRefreshClick(Sender: TObject);
var
  user_pt,warehouse_pt:Integer;
  deptcod:string;
begin
  user_pt:=DM.ADS834User_ptr.Value;
  deptcod := DM.ADS834DeptCode.Value;
  warehouse_pt := DM.ADS834warehouse_ptr.Value;
  
  dm.ADS834.Close;
  dm.ADS834.Prepared;
  dm.ADS834.Open;
//  if DM.ADS834.RecordCount>0 then
  dm.ADS834.Locate('User_ptr;DeptCode;warehouse_ptr',VarArrayOf([user_pt,deptcod,warehouse_pt]),[loPartialKey]);

end;

procedure Tfrm_Main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ADS834.CommandText);
end;

procedure Tfrm_Main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker = smDownEh) or (column.Title.SortMarker = smNoneEh) then
  begin
    column.Title.SortMarker := smUpEh;
    dm.ADS834.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADS834.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
    (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
  edit1.SetFocus;
end;

procedure Tfrm_Main.BitQueryClick(Sender: TObject);
var
  i:integer;
begin
  if frmQuerySet.ShowModal=mrok then
  begin
    dm.ADS834.Close;
    dm.ADS834.CommandText := sql_text;
    ssql:='';
    for i:=1 to frmQuerySet.SGrid1.RowCount-2 do
    ssql := ssql+ frmQuerySet.SGrid1.Cells[2,i]+#13;
    dm.ADS834.CommandText := sql_text+ssql;;
    dm.ADS834.Open;
  end;

end;

procedure Tfrm_Main.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure Tfrm_Main.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1)  then
  begin
    messagedlg('对不起!您没有该程序的新增权限',mtinformation,[mbok],0);
    Exit;
  end;
  try
    frm_Information := Tfrm_Information.Create(Application);
    frm_Information.status :=0;
    if frm_Information.ShowModal=mrok then
    begin
      dm.ADS834.Close;
      dm.ADS834.Open;
      dm.ADS834.Locate('User_ptr;DeptCode;warehouse_ptr',VarArrayOf([frm_Information.user_pt,frm_Information.deptcod,frm_Information.warehouse_pt]),[loPartialKey]);
      ShowMsg('新增操作成功!',1);
    end;
  finally
    frm_Information.Free;
  end;
end;

procedure Tfrm_Main.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)=1)  then
  begin
    messagedlg('对不起!您没有该程序的编辑权限',mtinformation,[mbok],0);
    Exit;
  end;
  try
    frm_Information := Tfrm_Information.Create(Application);
    frm_Information.status :=1;
    if frm_Information.ShowModal=mrok then
    begin
      dm.ADS834.Close;
      dm.ADS834.Open;
      dm.ADS834.Locate('User_ptr;DeptCode;warehouse_ptr',VarArrayOf([frm_Information.user_pt,frm_Information.deptcod,frm_Information.warehouse_pt]),[loPartialKey]);
      ShowMsg('编辑操作成功!',1);
    end;
  finally
    frm_Information.Free;
  end;
end;

procedure Tfrm_Main.N3Click(Sender: TObject);
begin
  if (strtoint(vprev)=1)  then
    messagedlg('对不起!您没有该程序的删除权限',mtinformation,[mbok],0)
  else  
  if MessageDlg('您确定要删除该信息接收人吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  begin
    try
      with dm.tmp do
      begin
        Close;
        SQL.Text := 'delete data0834 where User_ptr='+DM.ADS834User_ptr.AsString+
        ' and DeptCode='+quotedstr(dm.ADS834DeptCode.AsString)+' and warehouse_ptr='+dm.ADS834warehouse_ptr.AsString;
        if ExecSQL>0 then
        begin
          common.ShowMsg('删除操作成功！',1);
          self.BitRefreshClick(Sender);
        end;
      end;
    except
      on E: Exception do
      begin
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

procedure Tfrm_Main.N4Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起!您没有该程序的新增权限',mtinformation,[mbok],0);
    Exit;
  end;
  dm.tmp.Close;
  dm.tmp.SQL.Text := 'DELETE data0834 from data0834 inner join data0073 on data0834.user_ptr=data0073.rkey'+
                           ' where data0073.active_flag=1 ';
  dm.tmp.ExecSQL;
  BitRefreshClick(Sender);
end;

end.
