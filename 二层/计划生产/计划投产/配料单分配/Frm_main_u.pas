unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ADODB;

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
    N3: TMenuItem;
    N2: TMenuItem;
    BitBtn5: TBitBtn;
    PopupMenu2: TPopupMenu;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FsSearch:string;
    procedure init;
    procedure item_click(sender:TObject);
  public

  end;

var
  Frm_main: TFrm_main;

implementation
 uses common,DM_u,Frm_QrySet_u,Frm_detail_u, frm_alloc;
{$R *.dfm}

procedure TFrm_main.init;
var i:integer;
    item:TmenuItem;
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;

  for i := 1 to Grd1.Columns.Count do
  begin
    item := TmenuItem.Create(self);
    item.Caption := Grd1.Columns[i - 1].Title.Caption;
    item.Checked := Grd1.Columns[i - 1].Visible;
    item.OnClick := item_click;
    self.PopupMenu2.Items.Add(item);
  end;

  sSql:=DM.ADO468.SQL.Text;                                                                                        //只分配材料
  FsSearch:=' WHERE (dbo.Data0492.Con_Flag =2) AND (data0468.status=0) and (dbo.Data0468.QUAN_ISSUED < dbo.Data0468.QUAN_BOM) AND (dbo.Data0468.invent_or = 0) ';
  DM.ADO468.SQL.Append(FsSearch+' and data0492.ISSUE_DATE>=getdate()-7 ');
  DM.ADO468.Open;

  DM.FCurrDate:=common.getsystem_date(dm.tmp,1);

end;

procedure TFrm_main.FormCreate(Sender: TObject);
begin
//    dm.ADOCon.Open;
//  user_ptr := '3';
//  vprev := '4';


 if not App_Init(dm.ADOCon) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;

  Caption := application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
end;

procedure TFrm_main.BtCloseClick(Sender: TObject);
begin
  Frm_QrySet.Free;
  close;
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

procedure TFrm_main.BtBrushClick(Sender: TObject);
var
  i:integer;
begin
  i := DM.ADO468rkey.AsInteger ;
  DM.ADO468.Close;
  DM.ADO468.Open;

  Grd1TitleClick(PreColumn);
  Grd1TitleClick(PreColumn);
  if i>0 then
  DM.ADO468.Locate('rkey',i,[]);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO468.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO468.Sort:=Column.FieldName+' DESC';
  end;

  DM.ADO468AfterScroll(DM.ADO468);
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  if (field_name <> column.FieldName) then
   begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
   end
  else
   edit1.SetFocus;
end;

procedure TFrm_main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.ADO468quan_alloc.Value > 0 then
     Grd1.Canvas.Font.Color := clred ;

  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:= not DM.ADO468.IsEmpty and (dm.ADO468quan_alloc.Value=0);
  N2.Enabled:= N1.Enabled;
  N3.Enabled:= not DM.ADO468.IsEmpty and (dm.ADO468quan_alloc.Value>0);
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
    Sqlstr:=FsSearch+' and data0492.ISSUE_DATE >='''+formatdatetime('YYYY-MM-DD',Frm_QrySet.DateTimePicker1.Date)+
              ''' and data0492.ISSUE_DATE-1<='''+formatdatetime('YYYY-MM-DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr;
    DM.ADO468.SQL.Text:=sSql+Sqlstr;
    DM.ADO468.Close;
    DM.ADO468.Open;
  end;
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO468.SQL.Text);
end;

procedure TFrm_main.N1Click(Sender: TObject);
var Qty,Qty1:real;
//    isExpdate:boolean;
    
begin
  if (vprev='1') or (vprev='3') then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;

  case Tmenuitem(Sender).Tag of
  0:try
      DM.Fok:=true;
      Qty:=DM.ADO468QUAN_BOM.AsFloat-DM.ADO468QUAN_ISSUED.AsFloat;  //欠货
      DM.ADO22.Close;
      DM.ADO22.Parameters[0].Value:=DM.ADO468rkey17.Value;
      DM.ADO22.Open;
      Qty1:=0;
      DM.ADOCon.BeginTrans;
      while not DM.ADO22.Eof do
      begin
        if DM.ADO22EXPIRE_DATE.Value<DM.FCurrDate then  //库存材料有效期已过小于当前日期
        begin
         // isExpdate:=true;
          DM.ADO22.Next;
          continue;
        end;

        if DM.ADO22.FieldByName('是否检验OK').AsString='否'  then
        begin
         DM.ADO22.Next;
         continue;
        end;

        if  (DM.ADO468.FieldByName('rk23').Value>0) and (DM.ADO22.FieldByName('supp_ptr').AsString<>DM.ADO468.FieldByName('rk23').AsString ) then
        begin
        DM.ADO22.Next;
         continue;
        end;

        DM.ADO22.Edit;
        if DM.ADO22ValQty.AsFloat < Qty then
         begin
           DM.ADO22QUAN_TO_BE_STOCKED.AsFloat:=DM.ADO22QUAN_TO_BE_STOCKED.AsFloat+DM.ADO22ValQty.AsFloat;
           DM.ADO22.Post;
           DM.tmp.SQL.Text:='insert into data0475 values('+DM.ADO468rkey.AsString+','+DM.ADO22RKEY.AsString+','+DM.ADO22ValQty.AsString
             +','+user_ptr+','+ QuotedStr(DateToStr(DM.FCurrDate))+')';
           DM.tmp.ExecSQL;
           Qty:=Qty-DM.ADO22ValQty.AsFloat;
           Qty1:=Qty1+DM.ADO22ValQty.AsFloat;
         end
        else
         begin
           DM.ADO22QUAN_TO_BE_STOCKED.AsFloat:=DM.ADO22QUAN_TO_BE_STOCKED.AsFloat+Qty;
           Qty1:=Qty1+Qty;
           DM.ADO22.Post;
           DM.tmp.SQL.Text:='insert into data0475 values('+DM.ADO468rkey.AsString+','+DM.ADO22RKEY.AsString+','+floattostr(Qty)
             +','+user_ptr+','+ QuotedStr(DateToStr(DM.FCurrDate))+')';
           DM.tmp.ExecSQL;
           break;
         end;
        DM.ADO22.Next;
      end;
      if Qty1=0 then
      begin
        DM.ADOCon.RollbackTrans;
        DM.ADO22.Close;
        DM.Fok:=false;
        showmessage('此材料没有可供分配的有效库存!');
        exit;
      end;
      DM.ADO22.UpdateBatch(arAll);

      DM.ADO468.Edit;
      DM.ADO468quan_alloc.Value:=Qty1;
      DM.ADO468.Post;

      DM.tmp.SQL.Text:='update data0017 set QUAN_assign= QUAN_assign+'+floattostr(Qty1)+' where rkey='+DM.ADO468rkey17.AsString;
      DM.tmp.ExecSQL;
      DM.ADOCon.CommitTrans;
      if Qty1<DM.ADO468QUAN_BOM.AsFloat-DM.ADO468QUAN_ISSUED.AsFloat then
        showmessage('已部分分配,有效库存不足,请及时补充原材料!')
      else
        showmessage('已成功分配!');
      DM.ADO22.Close;
      DM.Fok:=false;
    except
      on  E: Exception do
      begin
        DM.ADOCon.RollbackTrans;
        DM.Fok:=false;
        ShowMessage(e.message);
      end;
      //showmessage('此材料分配失败,状态已发生变化...') ;
    end;

  1: with TFrm_detail.Create(nil) do
     try
       initd;
       showmodal ;
     finally
       free;
       DM.ADO475_1.Close;
       DM.ADO22.Close;
     end;

   2: begin
        dm.tmp.Close;
        DM.tmp.SQL.Text:='select rkey,quan_alloc from data0468 where rkey='+DM.ADO468rkey.AsString;
        DM.tmp.Open;
        if dm.tmp.FieldByName('quan_alloc').AsCurrency<>DM.ADO468quan_alloc.Value then
         ShowMsg('取消操作不成功!分配数量已发现变发!可能被其它用户取消或者已发料',1)
        else
        if MessageBox(Handle,'确定取消此材料分配吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDYES	then
        try
          Qty:=DM.ADO468quan_alloc.Value;
          DM.ADOCon.BeginTrans;
          DM.tmp.Close;
          DM.tmp.SQL.Text:='update data0022 set QUAN_TO_BE_STOCKED=QUAN_TO_BE_STOCKED-data0475.quan_alloc '+
                           'from data0022   inner join data0475   on data0022.RKEY = data0475.rkey22 where data0475.rkey468='+DM.ADO468rkey.AsString;
          DM.tmp.ExecSQL;

          DM.tmp.SQL.Text:='delete from data0475  where rkey468='+DM.ADO468rkey.AsString;
          DM.tmp.ExecSQL;

          DM.ADO468.Edit;
          DM.ADO468quan_alloc.Value:=0;
          DM.ADO468.Post;

          DM.tmp.SQL.Text:='update data0017 set QUAN_assign= QUAN_assign-'+floattostr(Qty)+' where rkey='+DM.ADO468rkey17.AsString;
          DM.tmp.ExecSQL;
          DM.ADOCon.CommitTrans;
        except
          DM.ADOCon.RollbackTrans;
          showmessage('取消此材料分配失败,状态已发生变化...');
        end;
      end;
  end;
  BtBrushClick(nil);
end;

procedure TFrm_main.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

procedure TFrm_main.item_click(sender: TObject);
var
  i:integer;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to Grd1.FieldCount - 1 do
    if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      Grd1.Columns[i].Visible := true;
      break;
    end ;
  end else begin
    for i := 0 to Grd1.FieldCount - 1 do
    if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      Grd1.Columns[i].Visible := false;
      break;
    end;
  end;

end;

procedure TFrm_main.BitBtn5Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
  if (vprev='1') or (vprev='3') then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
   with TForm_alloc.Create(nil) do
     try
       showmodal ;
     finally
       free;
     end;
end;

procedure TFrm_main.BitBtn2Click(Sender: TObject);
begin
 export_dbgrideh_to_excel(grd1,self.Caption);
end;

end.
