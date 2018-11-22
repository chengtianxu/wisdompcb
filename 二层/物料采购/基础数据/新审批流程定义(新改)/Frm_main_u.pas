unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB, ppDB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppStrtch, ppMemo, ppSubRpt;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    BtQry: TBitBtn;
    Edit1: TEdit;
    Panel3: TPanel;
    Grd1: TDBGridEh;
    Splitter1: TSplitter;
    Grd2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N12: TMenuItem;
    N5: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pm1: TPopupMenu;
    N7: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    PreColumn: TColumnEh;

    sSql :string;

    procedure item_click(sender: TObject);
  public

  end;

var
  Frm_main: TFrm_main;

implementation
 uses common,DM_u,Frm_QrySet_u,Frm_detail_u;
{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not App_Init_2(dm.ADOCon ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;

//  dm.ADOCon.Open;
//  rkey73:='851';
//  user_ptr := '963';
//  vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
 // init;
end;

procedure TFrm_main.BtCloseClick(Sender: TObject);
begin
  Frm_QrySet.Free;
  close;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin

  if trim(edit1.Text)<> '' then
  DM.ADO94.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.Text)+'%'''
  else
  DM.ADO94.Filter := '';
end;

procedure TFrm_main.BtBrushClick(Sender: TObject);
var
  i:integer;
  v_sort:string;
begin
  v_sort:=dm.ADO94.Sort;
//  ShowMessage(dm.ADO94.Sort);
  i := DM.ADO94rkey.AsInteger ;
  DM.ADO94.Close;
  DM.ADO94.Open;
  dm.ADO94.Sort:= v_sort;
  DM.ADO94.Locate('rkey',i,[]);


end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO94.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO94.Sort:=Column.FieldName+' DESC';
  end;

  DM.ADO94AfterScroll(DM.ADO94);

  if (Column.Field.DataType in  [ftString, ftWideString]) and
     (PreColumn.FieldName <> column.FieldName) then
   begin
    label1.Caption := column.Title.Caption ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
   end
  else
    edit1.SetFocus;
end;



procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  n2.Enabled:=not DM.ADO94.IsEmpty;    //编辑
  n3.Enabled:=n2.Enabled;    //检查
  n5.Enabled:=n2.Enabled;    //删除
  n6.Enabled:=n2.Enabled;    //复制
end;

procedure TFrm_main.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr,v_sort:string;
begin
//  if Frm_QrySet=nil then
//  Frm_QrySet:=TFrm_QrySet.Create(Application);

  if Frm_QrySet.ShowModal=mrok then
  begin

    v_sort:= DM.ADO94.Sort;
    DM.ADO94.Close;
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
    Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];
    DM.ADO94.SQL.Text:=sSql+Sqlstr;
    DM.ADO94.Open;

    DM.ADO94.Sort:=v_sort;
    
   { Grd1.Columns[0].Title.SortMarker:=smUpEh;
    PreColumn.Title.Color := clBtnFace;
    Grd1.Columns[0].Title.Color := clred;
    PreColumn := Grd1.Columns[0];
   }
  end;
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO94.SQL.Text);
end;

procedure TFrm_main.N1Click(Sender: TObject);
var
  v_sort:string;
begin
  if (Tmenuitem(Sender).Tag in [0,1,3,4]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  v_sort:=DM.ADO94.Sort;
  case Tmenuitem(Sender).Tag of
  0,1,2,3: with TFrm_detail.Create(nil) do
    try
      Ftag:=Tmenuitem(Sender).Tag;
      FGrd:=Grd2;
      initd;
      if showmodal=mrok then
      begin
        DM.ADO94.Close;
        DM.ADO94.Open;
        DM.ADO94.Sort:=v_sort;
        DM.ADO94.Locate('rkey',Frkey94,[]);
      end;
    finally
      free;
      DM.ADO275_1.Close;
      DM.ADO94_1.Close;
    end;
    4:
    begin
      if MessageBox(Handle,'确定删除此审批流程吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
      DM.ADOCon.BeginTrans;
      try
        DM.tmp.Close;
        DM.tmp.SQL.Text:='delete from data0094  where rkey='+DM.ADO94rkey.AsString;
        DM.tmp.ExecSQL;
        DM.ADOCon.CommitTrans;
        BtBrushClick(nil);
      except
        DM.ADOCon.RollbackTrans;
        showmessage('删除数据失败,此审批流程已被使用...');
      end;
    end;
  end;

end;

procedure TFrm_main.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to Grd1.FieldCount - 1 do
    if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      Grd1.Columns[i].Visible := true;
      break;
    end;
  end
  else
   begin
     for i := 0 to Grd1.FieldCount - 1 do
     if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
     begin
       Grd1.Columns[i].Visible := false;
       break;
     end;
   end;
end;

procedure TFrm_main.FormShow(Sender: TObject);
 var
  i:Integer;
  item:TMenuItem;
begin
  PreColumn := Grd1.Columns[0];
  sSql:=DM.ADO94.SQL.Text;
  DM.ADO94.SQL.Text:=DM.ADO94.SQL.Text+' order by data0094.code';
  DM.ADO94.Open;
  dm.ADO94.Sort := Grd1.Columns[0].FieldName;

  for i:=1 to Grd1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := Grd1.Columns[i-1].Title.Caption ;
    item.Checked := Grd1.Columns[i-1].Visible ;
    item.OnClick := item_click ;
    Self.pm1.Items.Add(item);
  end;

end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
  if not dm.ADO94.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  begin
   dm.ADO94.AfterScroll:=nil;
   Export_dbGridEH_to_Excel(self.Grd1,self.Caption);
   dm.ADO94.AfterScroll:=dm.ADO94AfterScroll;
  end;
end;

procedure TFrm_main.BitBtn2Click(Sender: TObject);
begin
  pm1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_main.N7Click(Sender: TObject);
begin
  dm.tmp.Close;
  dm.tmp.SQL.Text := 'DELETE data0275 from data0275 inner join data0073 on data0275.user_ptr=data0073.rkey'+
                         ' where data0073.active_flag=1 and dbo.Data0275.AUTH_GROUP_PTR='+dm.ADO94RKEY.AsString;
  dm.tmp.ExecSQL;
  BtBrushClick(Sender);
end;

end.
