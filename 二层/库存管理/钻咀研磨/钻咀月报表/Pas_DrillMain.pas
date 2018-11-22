unit Pas_DrillMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, ComCtrls,dateutils;

type
  TFrm_DrillMain = class(TForm)
    Panel1: TPanel;
    BtClose: TBitBtn;
    BtQry: TBitBtn;
    BitBtn6: TBitBtn;
    Grd1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N22: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N12: TMenuItem;
    N5: TMenuItem;
    N1: TMenuItem;
    N7: TMenuItem;
    PopupMenu2: TPopupMenu;
    Label1: TLabel;
    dtpBegin: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    BtBrush: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BtCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure BtQryClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    procedure init;
    procedure item_click(sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_DrillMain: TFrm_DrillMain;
  sCust:string;

implementation

uses common,DM, Pas_Main, Pas_InventoryCorrect;

{$R *.dfm}
procedure TFrm_DrillMain.item_click(sender: TObject);
var i:byte;
begin
  for i:=0 to Grd1.Columns.Count-1 do
  if Grd1.Columns[i].Tag=TMenuItem(sender).Tag then
  begin
    Grd1.Columns[i].Visible:=not Grd1.Columns[i].Visible;
    break;
  end;
  TMenuItem(sender).Checked:=not TMenuItem(sender).Checked;
end;

procedure TFrm_DrillMain.init;
var
 i:integer;
 item:TMenuItem;
begin
  dtpBegin.Date:=StartOfTheMonth(getsystem_date(TDM.ADOQuery1,1)); //第一天
  dtpEnd.Date:=EndOfTheMonth(getsystem_date(TDM.ADOQuery1,1)); //月最后一天
  field_name :='number';
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;
  TDM.Ado0223.Open;

  for i:=0 to Grd1.Columns.Count-1 do
  begin
    Grd1.Columns[i].Tag:=i;
    item := TmenuItem.Create(self) ;
    item.Tag:=i;
    item.Caption := Grd1.Columns[i].Title.Caption;
    item.Checked :=Grd1.Columns[i].Visible ;
    item.OnClick := item_click ;
    self.PopupMenu2.Items.Add(item) ;
  end;
  i:=pos(' ',trim(Application.Title));
  sCust:=copy(Application.Title,i+1,length(Application.Title)-i);
end;

procedure TFrm_DrillMain.BtCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_DrillMain.FormCreate(Sender: TObject);
begin
//  if not App_Init(TDM.ADOConn) then
//  begin
//    ShowMsg('程序起动失败请联系管理员',1);
//    application.Terminate;
//    exit;
//  end;
  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  user_ptr:='3116';
  vprev:='4';
end;

procedure TFrm_DrillMain.N22Click(Sender: TObject);
begin
  if (strtoint(vprev)<>2) and (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  TDM.Ftp:=TMenuItem(Sender).Tag;
  Frm_Main:=TFrm_Main.Create(Application);
  try
    if Frm_Main.ShowModal=mrok then
    begin
      TDM.Ado0223.Close;
      TDM.Ado0223.Open;
      TDM.Ado0223.Locate('Rkey',i0223Rkey,[]);
    end;
  finally
    Frm_Main.Free;
  end;
end;

procedure TFrm_DrillMain.BitBtn6Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_DrillMain.FormShow(Sender: TObject);
var i:Integer;
begin
  init;
  i:=pos(' ',trim(Application.Title));
  sCust:=copy(Application.Title,i+1,length(Application.Title)-i);
end;

procedure TFrm_DrillMain.Grd1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if TDM.Ado0223iStatus.Value = 1 then
     Grd1.Canvas.Font.Color := clred;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrm_DrillMain.BtQryClick(Sender: TObject);
var tmpDate:TDateTime;   
begin
  tmpDate:=IncMonth(now,1);
  EndOfTheMonth(tmpDate);
  ShowMessage(DateToStr(EndOfTheMonth(tmpDate)));
end;

procedure TFrm_DrillMain.N4Click(Sender: TObject);
begin
  if (strtoint(vprev)<>2) and (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (not TDM.Ado0223.IsEmpty) then
  begin
    if (TDM.Ado0223iStatus.Value=1) then
    begin
      showmessage('已审核单据不能再审！');
      exit;
    end;
    TDM.Ftp:=TMenuItem(Sender).Tag;
    TDM.ADOQuery1.Close;
    TDM.ADOQuery1.SQL.Text:='update data0223 set iStatus=1,dStatusDate=getdate(),Status05_Ptr='+user_ptr+' where rkey='+TDM.Ado0223Rkey.AsString+' and iStatus=0' ;
    TDM.ADOQuery1.ExecSQL;
    BtBrushClick(Sender);
  end;
end;

procedure TFrm_DrillMain.BtBrushClick(Sender: TObject);
var i:integer;
begin
  if not TDM.Ado0223.IsEmpty then i:=TDM.Ado0223Rkey.AsInteger;
    TDM.Ado0223.Close;
    TDM.Ado0223.Open;
    TDM.Ado0223.Locate('Rkey',i,[]);
end;

procedure TFrm_DrillMain.N7Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (not TDM.Ado0223.IsEmpty) then
  begin
    TDM.ADOQuery1.Close;
    TDM.ADOQuery1.SQL.Text:='select top 1 rkey from data0223 where rkey>'+TDM.Ado0223Rkey.AsString+' and iStatus=1';
    TDM.ADOQuery1.Open;
    if TDM.ADOQuery1.IsEmpty then
    begin
      TDM.ADOQuery1.Close;
      TDM.ADOQuery1.SQL.Text:='update data0223 set iStatus=0,Status05_Ptr=null,dStatusDate=null where rkey='+TDM.Ado0223Rkey.AsString;
      TDM.ADOQuery1.ExecSQL;
    end else
    begin
      showmessage('后期的数据已经审批,不能取消本期审批!');
      Exit;
    end;
    BtBrushClick(Sender);
  end;
end;

procedure TFrm_DrillMain.N5Click(Sender: TObject);
begin
  if (strtoint(vprev)<>2) and (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (not TDM.Ado0223.IsEmpty) then
  begin
    if (TDM.Ado0223iStatus.Value=1) and (strtoint(vprev)<>4) then
    begin
      showmessage('对不起,您的权限不够！');
      exit;
    end else if (TDM.Ado0223iStatus.Value=1) and (strtoint(vprev)=4) then
    begin
      showmessage('请取消单据审核再删除！');
      exit;
    end;
    if (Application.MessageBox('确定删除操作？', '操作提示', MB_OKCANCEL + MB_ICONINFORMATION) = IDCANCEL) then Exit;
    Frm_Main.DeleteRecord('data0224',TDM.Ado0223Rkey.AsString,TDM.ADOConn,'','','d0223_PTR','','');
    Frm_Main.DeleteRecord('data0223',TDM.Ado0223Rkey.AsString,TDM.ADOConn,'','','Rkey','','');
    BtBrushClick(Sender);
  end;
end;

procedure TFrm_DrillMain.N3Click(Sender: TObject);
begin
  if (not TDM.Ado0223.IsEmpty and (TMenuItem(Sender).Tag in [2])) then
  begin
    Frm_Main:=TFrm_Main.Create(nil);
    try
      Frm_Main.dtpBegin.Date:=DM.TDM.Ado0223dBeginDate.Value;
      Frm_Main.dtpEnd.Date:=dm.TDM.Ado0223dEndDate.Value;
      TDM.Ftp:=TMenuItem(Sender).Tag;
      if Frm_Main.ShowModal=mrok then
      begin
        TDM.Ado0223.Close;
        TDM.Ado0223.Open;
        TDM.Ado0223.Locate('Rkey',i0223Rkey,[]);
      end;
    finally
      Frm_Main.Free;
    end;
  end;
end;

procedure TFrm_DrillMain.BitBtn1Click(Sender: TObject);
begin
  if (not TDM.Ado0223.IsEmpty) and (TDM.Ado0223iStatus.Value=0) then
  begin
    Frm_InventoryCorrect:=TFrm_InventoryCorrect.Create(nil);
    try
      if Frm_InventoryCorrect.ShowModal=mrok then
      begin
        TDM.Ado0223.Close;
        TDM.Ado0223.Open;
        TDM.Ado0223.Locate('Rkey',i0223Rkey,[]);
      end;
    finally
      Frm_InventoryCorrect.Free;
    end;
  end;
end;

end.
