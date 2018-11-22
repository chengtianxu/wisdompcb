unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj,
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
    procedure FormCreate(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
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
 uses common,DM_u,Frm_detail_u,Frm_QrySet_u;
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
//  user_ptr := '785';
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
var  Fsfilter:string ;
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Fsfilter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Fsfilter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Fsfilter:='';
    Grd1.DataSource.DataSet.Filter:=Fsfilter;
  end;
end;

procedure TFrm_main.BtBrushClick(Sender: TObject);
var
  i:integer;
begin
  if DM.AQ157.IsEmpty then exit;
  i := DM.AQ157rkey.AsInteger ;
  DM.AQ157.Close;
  DM.AQ157.Open;
  DM.AQ157.Locate('rkey',i,[]);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
   if (column.Title.SortMarker=smNoneEh) or (column.Title.SortMarker =smDownEh)  then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.AQ157.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.AQ157.Sort:=Column.FieldName+' DESC';
  end;
  if field_name <> column.FieldName then
  begin
    if not (Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftTime, ftDateTime]) then
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
  sSql:=DM.AQ157.SQL.Text;
  DM.AQ157.Close;
  DM.AQ157.SQL.Text:=sSql+' where dbo.DATA0157.ENT_DATE>getdate()-14 order by dbo.DATA0157.PRINT_NUMBER';
  DM.AQ157.Open;
  field_name:='PRINT_NUMBER';
  PreColumn := Grd1.Columns[0] ;
  PreColumn.Title.Color := clred ;
end;

procedure TFrm_main.N6Click(Sender: TObject);
 begin
  case Tmenuitem(Sender).Tag of
  0,1: with TFrm_detail.Create(nil) do
       try
         Ftag:=Tmenuitem(Sender).Tag;
         FGrd:=Grd2;
         initd;
         if showmodal=mrok then
         begin
           DM.AQ157.Close;
           DM.AQ157.Open;
           DM.AQ157.Locate('rkey',Frkey157,[]);
         end;
       finally
         free;
       end;
   2: begin
        if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
        try
          DM.ADOCon.BeginTrans;
          DM.tmp.Close;
          DM.tmp.SQL.Text:='update data0153 set QTY_ON_HAND=QTY_ON_HAND+d158.OUT_QTY '+
                           'from data0153 d153 inner join data0158 d158 on d153.rkey=d158.STOCK_PTR '+
                           'where d158.PRINT_PTR='+DM.AQ157Rkey.AsString;
          DM.tmp.ExecSQL;

          DM.tmp.SQL.Text:='delete from data0157 where rkey='+DM.AQ157Rkey.AsString;
          if DM.tmp.ExecSQL=0 then
          begin
            DM.ADOCon.RollbackTrans;
            showmessage('删除数据失败,数据已被他人删除...');
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


procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:=(vprev='2') or (vprev='4') ;
  if dm.AQ157.IsEmpty then
  begin
    n2.Enabled := false;
    n3.Enabled := false;
  //  n5.Enabled := false;
  end else begin
    n2.Enabled :=N1.Enabled;
    n3.Enabled :=N1.Enabled;
   // n5.Enabled :=N1.Enabled;
  end;
end;

procedure TFrm_main.BtQryClick(Sender: TObject);
var i:integer;
    BefSqlstr,Sqlstr:widestring;
    tg:boolean;
begin
  tg:= false;
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    BefSqlstr:='';
    Sqlstr:='1=1';
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
    begin
      if Frm_QrySet.sgrid1.Cells[2,i]<> '' then
      begin
        if POS('data0025.',Frm_QrySet.sgrid1.Cells[2,i])>0 then  //处理客户型号,客户物料号
        begin
          if BefSqlstr='' then
            BefSqlstr:= ' and exists(select * from Data0158 inner join'+#13+
             'DATA0153 ON DATA0158.STOCK_PTR = DATA0153.rkey INNER JOIN'+#13+
             'Data0025 ON DATA0153.CUSTPART_PTR = Data0025.RKEY'+#13+
             'where DATA0157.rkey=Data0158.PRINT_PTR '+Frm_QrySet.sgrid1.Cells[2,i]+')'
          else
            BefSqlstr:= copy(BefSqlstr,1,length(BefSqlstr)-1)+' '+Frm_QrySet.sgrid1.Cells[2,i]+')';
          Continue;
        end;
        Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];
      end;
    end;
    dm.AQ157.SQL.Text:=sSql+#13+BefSqlstr+#13+#13+' where '+Sqlstr+' and dbo.DATA0157.ENT_DATE>='''+datetostr(Frm_QrySet.DateTimePicker1.Date)+
                       ''' and dbo.DATA0157.ENT_DATE<='''+datetostr(Frm_QrySet.DateTimePicker2.Date)+
                       ''' order by dbo.DATA0157.PRINT_NUMBER';
    dm.AQ157.Close;
    dm.AQ157.Open;
  end;
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.AQ157.SQL.Text);
end;

procedure TFrm_main.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

end.
