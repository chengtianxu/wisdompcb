unit UWZPR722;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB, ppDB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppStrtch, ppMemo, ppSubRpt, ComCtrls, DBCtrls, Mask, DBCtrlsEh, DBGrids;

type
  TMain_Form = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    BitBtn6: TBitBtn;
    BtQry: TBitBtn;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    CheckBox0: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    GroupBox1: TGroupBox;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure CheckBox0Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FsCheck:string;
    FCondition:string;
    FisWrite,FisAudit,FisAudit_self:boolean;
    sqltxt: tstringList;
    procedure item_click(sender:TObject);
    procedure init;
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Main_Form: TMain_Form;

implementation

uses common,Udm,UDetail,UEvaluate, UQuery,UReport;
{$R *.dfm}

procedure TMain_Form.FormCreate(Sender: TObject);
begin
if not App_Init_2(dm.ADOConnection1) then
   begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
   end;
 //self.Caption:=application.Title;
 //DM.ADOConnection1.Open;
  ShortTimeFormat:='HH:mm:ss';   //24小时制
  LongTimeFormat:='HH:mm:ss';
  DateSeparator := '-';
  shortDateFormat := 'yyyy-mm-dd';
  //user_ptr:='3';
  //vprev:='4';
  //rkey73:='1089';
    init;
end;

procedure TMain_Form.init;
begin
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  sSql:= dm.ADO722.SQL.Text;
  checkbox0Click(nil);
  dm.ADO722.Active := true;
  dm.ADO722_1.Active := true;
  dm.ADO493.Active := true;
  DM.tmp.Close;
 // Showmsg(rkey73,1);
  DM.tmp.SQL.Text:='select * from data0720 where rkey73= '+rkey73 ;
  DM.tmp.Open;
  FisAudit:=DM.tmp.Locate('ttype',0,[]);    //可审
  FisWrite:=DM.tmp.Locate('ttype',1,[]);    //可写

  DM.tmp.Close;
  DM.tmp.SQL.Text:='select d720_0.GrpName,d720_0.rkey73 from data0720 d720_0 inner join data0720 d720_1 on d720_0.GrpName=d720_1.GrpName '+
                   'and d720_0.ttype<>d720_1.ttype and d720_0.rkey73=d720_1.rkey73 '+
                   'where d720_1.rkey73='+rkey73 +
                   'group by d720_0.GrpName,d720_0.rkey73 having count(*)>1';
  DM.tmp.Open;
  FisAudit_self:=not DM.tmp.IsEmpty;    //可审自己
  DM.tmp.Close;

  if (vprev='1') or ((vprev='2')) then                                      //1.只能看自己,2.编辑自己
    FCondition:=' and (data0722.ReportID='+rkey73+')'
  else if vprev='3' then                                                    //3.可看所有的,不能编辑、不能审核
    FCondition:=' '
  else
                                                                 //4.审核权限定义的,编辑自己
  FCondition:=' and (data0722.ReportID='+rkey73+' or '+
                '(data0722.ReportID in (select rkey73 from data0720 where ttype=1 and grpName in (select distinct grpname from data0720 where rkey73='+rkey73+' and ttype=0)))) ';


  sSql:=DM.ADO722.SQL.Text+FCondition ;
  DM.ADO722.SQL.Text:=sSql+'order by data0722.LogNo';
  dm.ADO722.Parameters[0].Value:=common.getsystem_date(dm.Tmp,1)-15;
  dm.ADO722.Parameters[1].Value:=common.getsystem_date(dm.Tmp,1)+1;
  DM.ADO722.Open;

end;

procedure TMain_Form.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin

  if dm.ADOConnection1.Connected then
  begin
      DBGridEh1TitleClick(PreColumn);
      for i:=1 to DBGridEh1.Columns.Count do
      begin
          item := TmenuItem.Create(self) ;
          item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;

          if DBGridEh1.Columns[i-1].Visible then
              item.Checked := true ;
              item.OnClick := item_click ;
              PopupMenu1.Items.Add(item) ;
      end;
 end;
end;

procedure TMain_Form.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := true ;
                      break ;
                  end ;
      end
  else
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := false ;
                      break ;
                  end ;
      end ;
end;

procedure TMain_Form.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TMain_Form.BitBtn3Click(Sender: TObject);
var
  i:integer;
begin
if DM.ADO722.IsEmpty then exit;
  i := DM.ADO722rkey.AsInteger ;
  DM.ADO722.Close;
  DM.ADO722.Open;
  DM.ADO722.Locate('rkey',i,[]);
//  Showmsg(DM.ADO722.SQL.Text,1);
end;

procedure TMain_Form.BitBtn4Click(Sender: TObject);
begin
if DBGridEh1.DataSource.DataSet.Active then
              if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(DBGridEh1,'客户来访日志') ;
end;

procedure TMain_Form.BitBtn6Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TMain_Form.DBGridEh1TitleClick(Column: TColumnEh);
begin
 // if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO722.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO722.Sort:=Column.FieldName+' DESC';
  end;

  //if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
 begin
    label1.Caption:=column.Title.Caption;
    self.field_name:=column.FieldName;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
      edit1.SetFocus;
end;

procedure TMain_Form.CheckBox0Click(Sender: TObject);
var i:integer;
begin
  sqltxt := tstringList.Create;
  sqltxt.Text := DM.ADO722.SQL.Text ;
  sqltxt.Delete(13);
  FsCheck:=' and data0722.status in (-1,';
  for i:=0 to GroupBox1.ControlCount-1 do
  begin
    if GroupBox1.Controls[i] is  TCheckBox then
      if TCheckBox(GroupBox1.Controls[i]).Checked then FsCheck:=FsCheck+inttostr(GroupBox1.Controls[i].Tag)+',';
  end;
  FsCheck:=FsCheck+'-2) ';
  sqltxt.Insert(13, FsCheck);
  //DM.ADO722.SQL.Text:=sSql+FsSearch+FsCheck;
  DM.ADO722.SQL.Text:= sqltxt.Text;
  //Showmsg(DM.ADO722.SQL.Text,1);
  DM.ADO722.Close;
  DM.ADO722.Open;
end;

procedure TMain_Form.PopupMenu2Popup(Sender: TObject);
begin
  n1.Enabled:=(vprev='2') or ((vprev='4') and FisWrite) ; //and FisWrite;

  if DM.ADO722.IsEmpty then
  begin
    n2.Enabled:=false;    //编辑
    n3.Enabled:=false;    //提交审批
    n4.Enabled:=false;    //删除
    n5.Enabled:=false;    //cancel
    n7.Enabled:=false;    //审核
    n10.Enabled:=false;   //prt
    n11.Enabled:=false;   //查看
  end
  else       //FisWrite,FisAudit
  begin
    n2.Enabled:=((vprev='2') or ((vprev='4') and FisWrite)) and (dm.ADO722status.Value=0) and (rkey73=DM.ADO722ReportID.AsString) ;
    n3.Enabled:=n2.Enabled;
    n4.Enabled :=n2.Enabled;
    n5.Enabled:=((vprev='2') or ((vprev='4') and FisWrite)) and (dm.ADO722status.Value=1) and (rkey73=DM.ADO722ReportID.AsString) ;
    n7.Enabled:=((vprev='4') and (dm.ADO722status.Value=1) and ((((rkey73=DM.ADO722ReportID.AsString) and FisAudit_self)) or (rkey73<>DM.ADO722ReportID.AsString))) ; //4.审核权限定义的,编辑自己
    n9.Enabled:=vprev<>'1';
  end; 
end;

procedure TMain_Form.N1Click(Sender: TObject);
begin
  case Tmenuitem(Sender).Tag of
  0,1,7: with TDetail_Form.Create(nil) do
       try
         Ftag:=Tmenuitem(Sender).Tag;
         initd;
         if showmodal=mrok then
         begin
           DM.ADO722.Close;
           DM.ADO722.Open;
           DM.ADO722.Locate('rkey',Frkey722,[]);
         end;
       finally
         free;
         DM.ADO722_1.Close;
        DM.ADO722_1.Close;
       end;

   2: begin   //提交审批
        DM.tmp.Close;
        DM.tmp.SQL.Text:='update data0722 set status=1 where rkey='+DM.ADO722rkey.AsString+' and status=0' ;
        if DM.tmp.ExecSQL=0 then
          showmessage('此日志状态发生改变而未能成功提交!');
        BitBtn3Click(nil);
     end;

   3: begin
        if MessageBox(Handle,'确定删除此日志吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
          DM.tmp.Close;
          DM.tmp.SQL.Text:='delete from data0722 where rkey='+DM.ADO722rkey.AsString+' and status=0' ;
          if DM.tmp.ExecSQL<>1 then
            showmessage('删除数据失败,数据状态已发生变化...');
          BitBtn3Click(nil);
      end;

   4: begin
        if MessageBox(Handle,'确定取消提交吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
          DM.tmp.Close;
          DM.tmp.SQL.Text:='update data0722 set status=0 where rkey='+DM.ADO722rkey.AsString+' and status=1' ;
          if DM.tmp.ExecSQL<>1 then
            showmessage('取消提交此日志失败,数据状态已发生变化...');
          BitBtn3Click(nil);
      end;

   5: with TEva_Form.Create(nil) do
      try
        if showmodal=mrok then
        begin
          DM.tmp.Close;
          DM.tmp.SQL.Text:='update data0722 set status=2,Auditdate=getdate()'+
                           ',AuditID='+rkey73+
                           ',AuditRemark='''+Memo1.Text+'''  where rkey='+DM.ADO722rkey.AsString+' and status=1' ;
          if DM.tmp.ExecSQL<>1 then
            showmessage('审核拜访此日志失败,数据状态已发生变化...');
          BitBtn3Click(nil);
        end;
      finally
        free
      end;
   6:
      with TReport_Form.Create(nil) do
      try
        //ppReport1.Print;
          ppReport1.Reset;
          ppReport1.Template.FileName :=
          stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
              'Vst_Log.rtm';   
          ppReport1.Template.LoadFromFile;

          ppReport1.SaveAsTemplate:=false;
          ppReport1.Print;
        finally
          free;
      end;
  end;
end;

procedure TMain_Form.Edit1Change(Sender: TObject);
begin
if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TMain_Form.BitBtn2Click(Sender: TObject);
begin
with TReport_Form.Create(nil) do
      try
        ppReport1.Reset;
        ppReport1.Template.FileName :=
        stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'Vst_Log.rtm';
        ppReport1.Template.LoadFromFile;
        ppReport1.SaveAsTemplate:=true;
        ppdesigner1.ShowModal;
      finally
        free;
      end;
{self.ppReport1.Reset;
self.ppReport1.Template.FileName :=
  stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
    'Vst_Log.rtm.rtm';
self.ppReport1.Template.LoadFromFile;
self.ppReport1.SaveAsTemplate:=true;
self.ppdesigner1.ShowModal;  }
end;

procedure TMain_Form.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Query_Form=nil then  Query_Form:=TQuery_Form.Create(Application);
  if Query_Form.ShowModal=mrok then
  begin
      sqltxt := tstringList.Create;
      sqltxt.Text := DM.ADO722.SQL.Text ;
      sqltxt.Delete(15);
    for i:=1 to Query_Form.sgrid1.RowCount-2 do
      if Query_Form.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Query_Form.sgrid1.Cells[2,i];
    sqltxt.Insert(15, Sqlstr);

    dm.ADO722.Parameters[0].Value:=formatdatetime('YYYY/MM/DD',query_form.DateTimePicker1.Date);
    dm.ADO722.Parameters[1].Value:=formatdatetime('YYYY/MM/DD',query_form.DateTimePicker2.Date+1);                       
    DM.ADO722.SQL.Text:= sqltxt.Text;
    //Showmsg(DM.ADO722.SQL.Text,1);
    CheckBox0Click(nil);
    DM.ADO722.Close;
    DM.ADO722.Open;
  end;
end;

procedure TMain_Form.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
case dm.ADO722status.value of
 0: DBGridEh1.Canvas.Font.Color := clwindowText;
 1: DBGridEh1.Canvas.Font.Color := clolive;
 2: DBGridEh1.Canvas.Font.Color := clPurple;
 3: DBGridEh1.Canvas.Font.Color := clred;
  end;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TMain_Form.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADO722.SQL.Text);
end;

end.
