unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, Menus, StdCtrls, Buttons, DB, ADODB;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    BtQry: TBitBtn;
    Edit1: TEdit;
    BitBtn6: TBitBtn;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N12: TMenuItem;
    N5: TMenuItem;
    Grd1: TDBGridEh;
    N22: TMenuItem;
    N1: TMenuItem;
    PopupMenu2: TPopupMenu;
    N7: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtCloseClick(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    procedure init;
    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation
uses common,myclass,DM_u,Frm_EdtXh_u,Frm_Edt_u,Frm_QrySet_u;
{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin                                              
  if not App_Init(dm.ADOCon ) then
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
  init;
 // sCust:='演示版BAK';
end;

procedure TFrm_main.init;
var
 i:integer;
 item:TMenuItem;
begin
  Formula_Verify:=TFormula_Verify.Create(DM.ADOCon);
  MyDataClass:=TMyDataClass.Create(DM.ADOCon);

  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;

  sSql:=DM.ADO570.SQL.Text;
  DM.ADO570.SQL.Text:=DM.ADO570.SQL.Text+' where data0570.statistic_date>getdate()-31 order by number';
  DM.ADO570.Open;

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
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select getdate()';
  DM.tmp.Open;
  FCurrDate:=DM.tmp.Fields[0].AsDateTime;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_main.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
      if Frm_QrySet.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];
    DM.ADO570.SQL.Text:=sSql+' where data0570.statistic_date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
                           ''' and data0570.statistic_date<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr+
                           ' order by data0570.number';
    DM.ADO570.Close;
    DM.ADO570.Open;
  end;

end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO570.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO570.Sort:=Column.FieldName+' DESC';
  end;
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;

end;

procedure TFrm_main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.ADO570status.Value = 0 then
     Grd1.Canvas.Font.Color := clred ;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  N11.Enabled:=(vprev='2') or (vprev='4');     //new
  n22.Enabled := n11.Enabled;
  if DM.ADO570.IsEmpty then
  begin
    n2.Enabled:=false;    //编辑
    n3.Enabled:=false;    //检查
    n4.Enabled:=false;    //审批
    n5.Enabled:=false;    //删除
    n7.Enabled:=false;    //反审批
  end
  else
  begin
    n2.Enabled:=(dm.ADO570status.AsInteger=0) and N11.Enabled ;
    n3.Enabled := true;
    n4.Enabled := (vprev='4') and (dm.ADO570status.AsInteger=0);
    n5.Enabled := n2.Enabled;
    n7.Enabled := (vprev='4') and (dm.ADO570status.AsInteger=1);
  end;
end;

procedure TFrm_main.BtBrushClick(Sender: TObject);
var i:integer;
begin
  if not DM.ADO570.IsEmpty then i:=DM.ADO570rkey.AsInteger;
  DM.ADO570.Close;
  DM.ADO570.Open;
  DM.ADO570.Locate('rkey',i,[]);
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO570.SQL.Text);
end;

procedure TFrm_main.BtCloseClick(Sender: TObject);
begin
  Frm_QrySet.Free;
  close;
end;

procedure TFrm_main.N11Click(Sender: TObject);
begin
{    n2.Enabled:=false;    //编辑
    n3.Enabled:=false;    //检查
    n4.Enabled:=false;    //审批
    n5.Enabled:=false;    //删除
    n6.Enabled:=false;    //exl
    n7.Enabled:=false;    //反审批}

  if (TMenuItem(Sender).Tag=0) or (not DM.ADO570.IsEmpty and (DM.ADO570ttype.Value=0) and (TMenuItem(Sender).Tag in [2,3])) then
  begin
    Frm_EdtXh:=TFrm_EdtXh.Create(nil);
    try
      Fistate:=TMenuItem(Sender).Tag;
      Frm_EdtXh.Ftp:=TMenuItem(Sender).Tag;
      Frm_EdtXh.init;
      if Frm_EdtXh.ShowModal=mrok then
      begin
        DM.ADO570.Close;
        DM.ADO570.Open;
        DM.ADO570.Locate('rkey',rkey570,[]);
      end;
    finally
      Frm_EdtXh.Free;
      DM.ADO570_1.Close;
      DM.ADO571.Close;
      DM.ADO572.Close;
      DM.ADO572.LockType:=ltBatchOptimistic;
      DM.ADOPara.Close;
      DM.ADO569.Close;
    end;
  end else
  if (TMenuItem(Sender).Tag=1) or (not DM.ADO570.IsEmpty and (DM.ADO570ttype.Value=1) and (TMenuItem(Sender).Tag in [2,3])) then
  begin
    Frm_Edt:=TFrm_Edt.Create(nil);
    try
      Fistate:=TMenuItem(Sender).Tag;
      Frm_Edt.Ftp:=TMenuItem(Sender).Tag;
      Frm_Edt.init;
      if Frm_Edt.ShowModal=mrok then
      begin
        DM.ADO570.Close;
        DM.ADO570.Open;
        DM.ADO570.Locate('rkey',rkey570,[]);
      end;      
    finally
      Frm_Edt.Free;
      DM.ADO570_1.Close;
      DM.ADO571.Close;
      DM.ADOPara.Close;
      DM.ADO569.Close;
    end;
  end else begin
    case TMenuItem(Sender).Tag of
    4: begin     //审批
         DM.tmp.Close;
         DM.tmp.SQL.Text:='update data0570 set status=1,auth_date=getdate(),authempl_ptr='+user_ptr+' where rkey='+DM.ADO570RKEY.AsString+' and status=0' ;
         DM.tmp.ExecSQL;
       end;
    5: begin     //删除
         DM.tmp.Close;
         DM.tmp.SQL.Text:='delete from data0570 where rkey='+DM.ADO570RKEY.AsString+' and status=0' ;
         DM.tmp.ExecSQL;
       end;
    6: begin     //取消审批
          DM.tmp.Close;
          DM.tmp.SQL.Text:='select top 1 rkey from data0570 where rkey>'+dm.ADO570rkey.AsString+' and status=1 and ttype='+DM.ADO570ttype.AsString ;
          DM.tmp.Open;
          if DM.tmp.IsEmpty then
          begin
             DM.tmp.Close;
             DM.tmp.SQL.Text:='update data0570 set status=0,authempl_ptr=null where rkey='+DM.ADO570RKEY.AsString;
             DM.tmp.ExecSQL;
          end else
            showmessage('后期的数据已经审批,不能取消本期审批');
      end;
    end;
    BtBrushClick(Sender);
  end;
end;

procedure TFrm_main.BitBtn6Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_main.item_click(sender: TObject);
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

procedure TFrm_main.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

procedure TFrm_main.FormDestroy(Sender: TObject);
begin
  Formula_Verify.Free;
  MyDataClass.Free;
end;

end.
