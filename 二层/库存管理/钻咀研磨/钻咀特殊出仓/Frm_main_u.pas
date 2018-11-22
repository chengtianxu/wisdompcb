unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB;

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
    N4: TMenuItem;
    N12: TMenuItem;
    N5: TMenuItem;
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
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    procedure init;
  public

  end;

var
  Frm_main: TFrm_main;

implementation
 uses common,DM_u,Frm_QrySet_u,Frm_detail_u;
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
  if DM.ADO221.IsEmpty then exit;
  i := DM.ADO221rkey.AsInteger ;
  DM.ADO221.Close;
  DM.ADO221.Open;
  DM.ADO221.Locate('rkey',i,[]);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if column.Title.SortMarker =smDownEh then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.ADO221.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADO221.Sort:=Column.FieldName+' DESC';
  end;
  if field_name <> column.FieldName then
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

procedure TFrm_main.init;
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;
  sSql:=DM.ADO221.SQL.Text;
  DM.ADO221.SQL.Text:=DM.ADO221.SQL.Text+' where data0221.sys_date>getdate()-7 order by number';
  DM.ADO221.Open;
end;

procedure TFrm_main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.ADO221status.Value = 3 then
     Grd1.Canvas.Font.Color := clred
  else if dm.ADO221status.Value = 2 then
     Grd1.Canvas.Font.Color := clTeal //cllime
  else if dm.ADO221status.Value = 1 then
     Grd1.Canvas.Font.Color := clfuchsia;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  if dm.ADO221.IsEmpty then
  begin
    n2.Enabled:=false;    //编辑
    n3.Enabled:=false;    //检查
    n4.Enabled:=false;    //提交审批
    n5.Enabled:=false;    //删除
  end
  else
  begin
    n2.Enabled:=dm.ADO221status.AsInteger in [0,3];
    n3.Enabled := true;
    n4.Enabled := dm.ADO221status.AsInteger=0;
    n5.Enabled:=dm.ADO221status.AsInteger in [0,3];
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
    dm.ADO221.SQL.Text:=sSql+' where data0221.sys_date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
                           ''' and data0221.sys_date<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr+
                           ' order by data0221.number';
    dm.ADO221.Close;
    dm.ADO221.Open;
  end;
end;



procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO221.SQL.Text);
end;

procedure TFrm_main.N1Click(Sender: TObject);
begin
  if (Tmenuitem(Sender).Tag in [0,1,3,4]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;

  case Tmenuitem(Sender).Tag of
  0,1,2: with TFrm_detail.Create(nil) do
       try
         Ftag:=Tmenuitem(Sender).Tag;
         FGrd:=Grd2;
         initd;
         if showmodal=mrok then
         begin
           DM.ADO221.Close;
           DM.ADO221.Open;
           DM.ADO221.Locate('rkey',Frkey221,[]);
         end;
       finally
         free;
         DM.ADO221_1.Close;
         DM.ADO222_1.Close;
       end;
   3: begin
        DM.ADO221.Edit;
        DM.ADO221.FieldByName('status').AsInteger:=1;
        DM.ADO221.Post;
        BtBrushClick(Sender);
      end;
   4: begin
        DM.ADOCon.BeginTrans;
        try
          DM.tmp.Close;
          DM.tmp.SQL.Text:='update data0220 set quan_alloc=quan_alloc-d222.quantity from '+
                           'data0220 d220 inner join data0222 d222 on d220.rkey=d222.bach_PTR '+
                           'where d222.head_PTR='+DM.ADO221.FieldByName('rkey').AsString+
                           ' and d220.quan_alloc>=d222.quantity';
          if DM.tmp.ExecSQL<>DM.ADO222.RecordCount then
          begin
            DM.ADOCon.RollbackTrans;
            showmessage('保存数据时,当前待出库数不足,保存失败...');
            exit;
          end;

          DM.tmp.SQL.Text:='delete from data0221 where rkey='+DM.ADO221Rkey.AsString+' and status in (0,3)' ;
          if DM.tmp.ExecSQL=0 then
          begin
            DM.ADOCon.RollbackTrans;
            showmessage('删除数据失败,数据状态已发生变化...');
          end else
            DM.ADOCon.CommitTrans;
          BtBrushClick(nil);
       except
         DM.ADOCon.RollbackTrans;
         showmessage('删除数据失败...');
       end;
      end;
  end;
end;

end.
