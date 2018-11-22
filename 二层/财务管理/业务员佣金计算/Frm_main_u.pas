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
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N12: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
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

  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FsSearch:string;
    FsRep:string;
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
//  if not App_Init(dm.ADOCon ) then
//  begin
//    ShowMsg('程序起动失败请联系管理员',1);
//    application.Terminate;
//    exit;
//  end;
//  Caption := application.Title;


  dm.ADOCon.Open;
  user_ptr := '3';
  vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
end;

procedure TFrm_main.init;
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;
  sSql:=DM.ADO122.SQL.Text;
  if vprev='1' then
     FsRep:=' and data0122.SALES_REP_PTR='+user_ptr+' '
  else
     FsRep:=' and 1=1 ';
  //1.业务员只能看自己
  //2.财务计算人员
  //3.老板看所有人员
  //4.财务审核人员
  FsSearch:=' where (auth_empl_ptr is null or data0122.create_date>getdate()-14) '+FsRep;
  DM.ADO122.SQL.Text:=DM.ADO122.SQL.Text+FsSearch+'order by comm_code';
  DM.ADO122.Open;
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
  i:=-1;
  if not DM.ADO122.IsEmpty then i:=DM.ADO122rkey.AsInteger ;
  DM.ADO122.Close;
  DM.ADO122.Open;
  DM.ADO122.Locate('rkey',i,[]);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO122.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO122.Sort:=Column.FieldName+' DESC';
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
  if DM.ADO122auth_empl_ptr.isnull then
     Grd1.Canvas.brush.Color := $00D7BDEC;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:=(vprev='2') or (vprev='4');                                                 //add
  N2.Enabled:=N1.Enabled and not DM.ADO122.IsEmpty and DM.ADO122auth_empl_ptr.isnull;     //edit
  n3.Enabled:=N2.Enabled;                                                                 //del
  n4.Enabled:=not DM.ADO122.IsEmpty;                                                      //look

  n5.Enabled:=(vprev='4') and not DM.ADO122.IsEmpty and DM.ADO122auth_empl_ptr.isnull;    //Au
  n6.Enabled:=(vprev='4') and not DM.ADO122.IsEmpty and not DM.ADO122auth_empl_ptr.isnull; //unAu
  N8.Enabled:=N1.Enabled and not DM.ADO122.IsEmpty;                                       //copy
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
    FsSearch:=' where data0122.create_date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
              ''' and data0122.create_date-1<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr;
    DM.ADO122.SQL.Text:=sSql+FsSearch+FsRep+' order by comm_code';
    BtBrushClick(nil);
  end;
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO122.SQL.Text);
end;

procedure TFrm_main.N1Click(Sender: TObject);
begin
  case Tmenuitem(Sender).Tag of
  0,1,2,6:
       with TFrm_detail.Create(nil) do
       try
         Ftag:=Tmenuitem(Sender).Tag;
         initd;
         if showmodal=mrok then
         begin
           DM.ADO122.Close;
           DM.ADO122.Open;
           DM.ADO122.Locate('rkey',Frkey122,[]);
         end;
       finally
         free;
         DM.ADO122_1.Close;
         DM.ADO123_1.Close;
         DM.ADO124.Close;
         DM.ADO126.Close;
       end;

   3: begin
        if MessageBox(Handle,'确定删除此提成单吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
        DM.tmp.Close;
        DM.tmp.SQL.Text:='delete from data0122  where rkey='+DM.ADO122rkey.AsString+' and auth_empl_ptr is null';
        if DM.tmp.ExecSQL<>1 then
          showmessage('删除数据失败,提成单状态已发生变化...')
        else
          DM.ADO122.Prior;
        BtBrushClick(nil);
      end;

   4: begin
        DM.tmp.Close;
        DM.tmp.SQL.Text:='select top 1 comm_code rkey from data0122 where rkey<>'+DM.ADO122rkey.AsString+
                         ' and customer_ptr='+DM.ADO122customer_ptr.AsString+
                         ' and SALES_REP_PTR='+DM.ADO122SALES_REP_PTR.AsString+
                         ' and ((coll_startdate between '''+DM.ADO122coll_startdate.AsString+''' and '''+DM.ADO122coll_enddate.AsString+
                         ''') or (coll_enddate between '''+DM.ADO122coll_startdate.AsString+''' and '''+DM.ADO122coll_enddate.AsString+'''))';

        DM.tmp.Open;
        if not DM.tmp.IsEmpty then
        begin
          showmessage('提成单号:'+DM.tmp.Fields[0].asstring+'与此提成单的的区间相交叉,'+#13+'业务员不能对同一客户同时期提成多次,不能审核...');
          exit;
        end;
        if MessageBox(Handle,'确定审核此提成单吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
        DM.tmp.Close;
        DM.tmp.SQL.Text:='update data0122 set auth_empl_ptr='+user_ptr+',auth_date=getdate() where rkey='+DM.ADO122rkey.AsString+' and auth_empl_ptr is null';
        if DM.tmp.ExecSQL<>1 then
          showmessage('审核此提成单失败,数据状态已发生变化...');
        BtBrushClick(nil);
      end;
   5: begin
        if MessageBox(Handle,'确定取消审核此提成单吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
        DM.tmp.Close;
        DM.tmp.SQL.Text:='update data0122 set auth_empl_ptr=null,auth_date=null where rkey='+DM.ADO122rkey.AsString+' and auth_empl_ptr is not null';
        if DM.tmp.ExecSQL<>1 then
          showmessage('取消审核此提成单失败,数据状态已发生变化...');
        BtBrushClick(nil);
      end;
  end;
end;

procedure TFrm_main.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

end.
