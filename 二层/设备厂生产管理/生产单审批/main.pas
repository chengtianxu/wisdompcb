unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, Grids, DBGridEh, DB, ADODB;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    DBGridEh1: TDBGridEh;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    sql_text:string;
    
    procedure item_click(sender:TObject);
    function StatusChange(rkey:string):Boolean;
    function IsConfirm(CutNo:string):Boolean;
    procedure AutoFixWidth(objDBGrid: TDBGridEH);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo,common,condition;

{$R *.dfm}

procedure tform1.item_click(sender:TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i:=0 to DBGridEh1.FieldCount-1 do
      if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
      begin
        DBGridEh1.Columns[i].Visible:=true;
        break;
      end;
  end
  else
    begin
      for i:=0 to DBGridEh1.FieldCount-1 do
        if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
        begin
          DBGridEh1.Columns[i].Visible:=false;
          break;
        end;
    end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
  application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
  if dm.ADOConnection1.Connected then
  begin
    dm.ads491.Close;
    dm.ads491.Parameters.ParamByName('dtpk1').Value:=getsystem_date(dm.ADOQuery1,1);
    dm.ads491.Parameters.ParamByName('dtpk2').Value:=getsystem_date(dm.ADOQuery1,1)+1;
    dm.ads491.Open;
    sql_text := dm.ads491.CommandText;
    PreColumn := DBGridEH1.Columns[0];
    for i:=1 to DBGrideh1.Columns.Count do
    begin
      item := TmenuItem.Create(self) ;
      item.Caption := dbgrideh1.Columns[i-1].Title.Caption ;
      if dbgrideh1.Columns[i-1].Visible then
        item.Checked := true ;
      item.OnClick := item_click ;
      self.PopupMenu1.Items.Add(item) ;
    end;
    //AutoFixWidth(DBGridEh1);
  end;  
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  if not DBGridEh1.DataSource.DataSet.IsEmpty then
    Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker =smDownEh then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.ads491.IndexFieldNames:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ads491.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName) then
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

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if (trim(edit1.Text)<> '')  then
    dm.ads491.Filter:=PreColumn.FieldName+' like ''%'+trim(edit1.Text)+'%'''
  else
    dm.ads491.Filter:='';
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
  rkey:string;
begin
  rkey:=dm.ads491CUT_NO.Value;
  dm.ads491.Close;
  dm.ads491.Open;
  if rkey<>'' then dm.ads491.Locate('cut_no',rkey,[]);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
  i:byte;
begin
  with  form_condition do
  begin
    dtpk1.Date:= strtodate(formatdatetime('yyyy-mm-dd',
                 dm.ads491.Parameters.ParamValues['dtpk1']));

    dtpk2.Date:= strtodate(formatdatetime('yyyy-mm-dd',
                 dm.ads491.Parameters.ParamValues['dtpk2']-1));

    if ShowModal=mrok then
    begin
      with dm.ads491 do
      begin
        close;
        CommandText:=self.sql_text;
        for i:=1 to form_condition.SGrid1.RowCount-2 do
          dm.ads491.CommandText:=dm.ads491.CommandText+form_condition.SGrid1.Cells[2,i]+#13;
        Parameters.ParamValues['dtpk1']:=strtodate(formatdatetime('yyyy-mm-dd ',dtpk1.Date));
//        ShowMessage(dm.ads491.CommandText);
        Parameters.ParamValues['dtpk2']:=strtodate(formatdatetime('yyyy-mm-dd ',dtpk2.Date+1));
        open;
      end;
    end;
  end;
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ads491.CommandText);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if dm.ADOConnection1.Connected then
    begin
      ShowMessage('程序在测试模式下运行，请在发布程序前断开数据库后编译！');
      vprev:='4';
      user_ptr:='3';
    end
  else
    if not app_init(dm.ADOConnection1) then
    begin
      showmsg('程序起动失败,请联系管理员!',1);
      application.Terminate;
    end; 
  self.caption:=application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  LongDateFormat:='YYYY-MM-DD HH:NN:SS'
end;

procedure TForm1.N1Click(Sender: TObject);
var
  rkey492:Integer;
begin
  if (vprev = '1') or (vprev = '3') then
    showmsg('你只有检查权限不能做审核操作',1)
  else
  if StatusChange(dm.ads491rkey.AsString) then
  begin
    showmsg('审核状态发生变化,操作失败!',1);
    bitbtn3click(sender);
  end
  else
    begin
      rkey492 :=dm.ads491rkey.AsInteger;
      dm.ads491.Edit;
      dm.ads491TSTATUS.Value:=0;
      dm.ads491APP_BY_PTR.Value:=strtoint(user_ptr);
      dm.ads491APP_DATE.Value:=getsystem_date(dm.ADOQuery1,0);
      dm.ads491.Post;
      dm.ads491.Close;
      dm.ads491.Open;
      dm.ads491.Locate('rkey',rkey492,[]);
      showmsg('审核成功!',1);
    end;
end;

procedure TForm1.PopupMenu2Popup(Sender: TObject);
begin
  if dm.ads491.IsEmpty then
    begin
      n1.Enabled:=false;
      n2.Enabled:=false;
      n3.Enabled:=false;
    end
  else
    begin
      if dm.ads491TSTATUS.Value=0 then
        begin
          n1.Enabled:=false;
          n2.Enabled:=true;
          n3.Enabled:=true;
        end
      else
        begin
          n1.Enabled:=true;
          n2.Enabled:=false;
          n3.Enabled:=false;
        end;
    end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
  rkey492:Integer;
begin
  if (vprev = '1') or (vprev = '3') then
    showmsg('你只有检查权限不能做取消审核操作!',1)
  else
    if StatusChange(dm.ads491rkey.AsString) then
      begin
        showmsg('审核状态发生变化,操作失败!',1);
        bitbtn3click(sender);
      end
    else
      begin
        if IsConfirm(dm.ads491CUT_NO.AsString) then
        begin
          showmsg('生产单已被确认，无法取消审核!',1);
          exit;
        end;
        rkey492 :=dm.ads491rkey.AsInteger;
        dm.ads491.Edit;
        dm.ads491TSTATUS.Value:=1;
        dm.ads491APP_BY_PTR.AsVariant:=null;
        dm.ads491APP_DATE.AsVariant:=null;
        dm.ads491.Post;
        dm.ads491.Close;
        dm.ads491.Open;
        dm.ads491.Locate('rkey',rkey492,[]);
        showmsg('取消审核成功!',1);
      end;
end;


procedure TForm1.N3Click(Sender: TObject);
begin
  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='select employee_name from data0005 where rkey='+dm.ads491APP_BY_PTR.AsString;
    open;
  end;

  showmsg(dm.ADOQuery1.fieldbyname('employee_name').AsString+
          '于日期:'+dm.ads491APP_DATE.AsString+'审核',1);
end;

function TForm1.StatusChange(rkey: string): Boolean;
begin
  Result :=False;
  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='SELECT TSTATUS FROM  dbo.data0492 WHERE rkey = '+rkey;
    open;
    if not isempty then
      if fieldbyname('TSTATUS').AsInteger<> dm.ads491TSTATUS.AsInteger then
        Result:=true;
  end;
end;

function TForm1.IsConfirm(CutNo: string): Boolean;
begin
  Result :=False;
  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='SELECT STATUS,CUT_NO '+
              'FROM dbo.Data0468 '+
              'WHERE (STATUS < 2) AND (CUT_NO = '''+CutNo+''')';
    open;
    if not isempty then Result:=true;
  end;
end;

procedure TForm1.AutoFixWidth(objDBGrid:TDBGridEH);
var
  cc:integer;
  i,tmpLength:integer;
  objDataSet:TDataSet;
  aDgCLength:array of integer;
begin
  cc:=objDbGrid.Columns.Count-1;
  objDataSet:=objDbGrid.DataSource.DataSet;
  setlength(aDgCLength,cc+1);
  //取标题字段的长度
  for i:=0 to cc do
  begin
    aDgCLength[i]:=Canvas.TextWidth(objDbGrid.Columns[i].Title.Caption);
  end;

  objDataSet.First;
  while not objDataSet.Eof do
  begin
    //取列中每个字段的长度
    for i:=0 to cc do
    begin
      tmpLength:=Canvas.TextWidth(objDataSet.Fields.Fields[i].DisplayText);
      if tmpLength>aDgCLength[i] then aDgCLength[i]:=tmpLength;
    end;
    objDataSet.Next;
  end;

  for i:=0 to cc do
  begin
    objDbGrid.Columns[i].Width:=aDgCLength[i];
  end;
end;

end.
