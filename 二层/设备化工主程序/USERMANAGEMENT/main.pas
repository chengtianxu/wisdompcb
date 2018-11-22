unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DB, DBTables, Mask,
  DBCtrls, Menus, ADODB, ExtCtrls;

type
  TFrmMain = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    PopupMenu1: TPopupMenu;
    add: TMenuItem;
    edit: TMenuItem;
    delete: TMenuItem;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Splitter1: TSplitter;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Label5: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Bar1: TStatusBar;
    RadioGroup1: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure Adodata0151AfterDelete(DataSet: TDataSet);
    procedure Adodata0151DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure Adodata0151PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure editClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure RadioGroup1Click(Sender: TObject);
  private
    vindex:Integer;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses datamodule,unit1,unit2,grp_search,common;

{$R *.dfm}

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
  application.Terminate;
  close;
end;

procedure TFrmMain.deleteClick(Sender: TObject);
begin
  if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
    try
      dm.ADOData0073.Delete;
    except
      messagedlg('该用户已经有记录存在，删除不成功！',mtinformation,[mbok],0);
      exit;
    end;
  end;
end;

procedure TFrmMain.Adodata0151AfterDelete(DataSet: TDataSet);
begin
  messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

procedure TFrmMain.Adodata0151DeleteError(DataSet: TDataSet; E: EDatabaseError;
 var Action: TDataAction);
begin
 messagedlg('不能删除已经在使用的代号！',mtWarning,[mbOk],0);
  Abort;
end;

procedure TFrmMain.Adodata0151PostError(DataSet: TDataSet; E: EDatabaseError;
 var Action: TDataAction);
begin
 messagedlg('不能使用重复的代号！',mtWarning,[mbOk],0);
 Abort;
end;

procedure TFrmMain.FormKeyPress(Sender: TObject; var Key: Char);
var
 searchoption:tlocateoptions;
begin
 searchoption:=[lopartialkey];
if Key = Chr(vk_Back) then       //如果按下了backspace
   begin
    if length(bar1.Panels[1].text)>10 then
     bar1.Panels[1].text:=copy(bar1.Panels[1].text,1,length(bar1.Panels[1].text)-1);
    if length(bar1.Panels[1].text)>10 then
       dm.ADOData0073.Locate(Dbgrid1.Columns[vindex].Field.FieldName,copy(bar1.Panels[1].text,11,length(bar1.Panels[1].text)),searchoption)
    else
     dm.ADOData0073.First
   end
  else
     begin
       bar1.Panels[1].text :=bar1.Panels[1].text+key;
       dm.ADOData0073.Locate(Dbgrid1.Columns[vindex].Field.FieldName,copy(bar1.Panels[1].text,11,length(bar1.Panels[1].text)),searchoption);
     end;
end;

procedure TFrmMain.editClick(Sender: TObject);
var
  vstr:string;
  vrec:integer;
begin
  with dm.ADOData0074 do
   begin
    close;
    parameters.ParamByName('vptr').Value :=dm.Adodata0073.fieldbyname('rkey').AsInteger ;
    open;
   end;
  if dm.ADOData0073.FieldByName('user_group_flag').asinteger=1 then
   begin
    Application.CreateForm(TForm2, Form2);
    dm.adodata0073.edit;
    Form2.ttype.Caption :='1';
    Form2.showmodal;
    Form2.free;
   end
  else
  begin
    with dm.ADOData0074bk do
     begin
      close;
      parameters.ParamByName('vptr').Value :=dm.Adodata0073.fieldbyname('rkey').AsInteger ;
      open;
     end;
    Application.CreateForm(TForm1, Form1);
    Form1.ttype.Caption :='1';
    Form1.showmodal;
    Form1.free;

    with dm.ADOData0074 do
     begin
      close;
      parameters.ParamByName('vptr').Value :=dm.Adodata0073.fieldbyname('rkey').AsInteger ;
      open;
     end;
    vstr:= dm.ADOData0073.Filter;
    vrec:= dm.ADOData0073.RecNo;
    dm.ADOData0073.DisableControls;
    dm.ADOData0073.Filter :='group_ptr = '+dm.Adodata0073.fieldbyname('rkey').AsString ;
    dm.ADOData0073.First;
    with dm.ADOData0073 do
    while not eof do
     begin
      with dm.ADOData0074a do
      begin
        close;
        parameters.ParamByName('vptr').Value :=dm.Adodata0073.fieldbyname('rkey').AsInteger ;
        open;
      end;
      dm.ADOData0074.First;
      with dm.ADOData0074 do
      while not eof do
      begin
        if not dm.ADOData0074a.Locate('function_id',fieldbyname('function_id').AsInteger,[]) then
        begin
          dm.ADOData0074a.Append ;
          dm.ADOData0074a.FieldByName('user_ptr').AsInteger :=dm.Adodata0073.fieldbyname('rkey').AsInteger;
          dm.ADOData0074a.FieldByName('function_id').AsInteger :=FieldByName('function_id').AsInteger;
          dm.ADOData0074a.FieldByName('user_rights').AsInteger :=FieldByName('user_rights').AsInteger;
        end else
        if dm.ADOData0074a.FieldByName('user_rights').AsInteger < FieldByName('user_rights').AsInteger then
        begin
          dm.ADOData0074a.Edit ;
          dm.ADOData0074a.FieldByName('user_rights').AsInteger :=FieldByName('user_rights').AsInteger;
        end;
        next;
      end;

      dm.ADOData0074a.First;
      with dm.ADOData0074a do
      while not eof do
       begin
        if dm.ADOData0074bk.Locate('function_id',fieldbyname('function_id').AsInteger,[]) then //原来组权限中有
        begin
         dm.ADOData0074.Locate('function_id',fieldbyname('function_id').AsInteger,[]);
         if dm.ADOData0074.FieldByName('user_rights').AsInteger=0 then //新的组权限中没有
          dm.ADOData0074a.Delete
         else
          next
        end else
          next;
       end;

      dm.ADOData0074a.UpdateBatch();
      next;
    end;
    dm.ADOData0073.Filter:=vstr;
    dm.ADOData0073.MoveBy(vrec-dm.ADOData0073.RecNo);
    dm.ADOData0073.EnableControls;
  end;
  bar1.SimpleText:=copy(bar1.SimpleText,1,10);
end;

procedure TFrmMain.FormActivate(Sender: TObject);
begin
  dm.ADOData0073.Open ;
  dm.ADOData0419.Open ;
  bar1.Panels[1].Text :='Searching:'
end;

procedure TFrmMain.N1Click(Sender: TObject);
begin
  with dm.ADOData0074 do
  begin
    close;
    parameters.ParamByName('vptr').Value :=0;
    open;
  end;
  dm.ADOData0073.Append;
  dm.ADOData0073.Fieldbyname('user_group_flag').asinteger:=0;
  Application.CreateForm(TForm1, Form1);
  Form1.showmodal;
  Form1.free;
  bar1.SimpleText:=copy(bar1.SimpleText,1,10);
end;

procedure TFrmMain.N2Click(Sender: TObject);
begin
  with dm.ADOData0074 do
  begin
    close;
    parameters.ParamByName('vptr').Value :=0;
    open;
  end;
  dm.ADOData0073.Append;
  dm.ADOData0073.Fieldbyname('user_group_flag').asinteger:=1;
  dm.ADOData0073.Fieldbyname('ACTIVE_FLAG').asinteger:=0;
  dm.ADOData0073.Fieldbyname('LANGUAGE_FLAG').asstring:='C';
  Application.CreateForm(TForm2, Form2);
  Form2.Edit7.text:=dm.ADOData0073.fieldbyname('user_password').asstring;
  Form2.showmodal;
  Form2.free;
  bar1.SimpleText:=copy(bar1.SimpleText,1,10);
end;

procedure TFrmMain.FormCreate(Sender: TObject);

begin
 if not App_Init(dm.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
 self.Caption:=application.Title;

end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  vindex:=0;

  DM.ADOData0073.Open ;
  DM.ADO0073.Open ;
  DM.ADO0005.Open ;
end;

procedure TFrmMain.N4Click(Sender: TObject);
var
  vrkey:integer;
begin
  with dm.ADOData0074A do
  begin
    close;
    parameters.ParamByName('vptr').Value :=dm.Adodata0073.fieldbyname('rkey').AsInteger ;
    open;
  end;
  vrkey:=dm.Adodata0073.fieldbyname('group_ptr').AsInteger ;

  with dm.ADOData0074 do
  begin
    close;
    parameters.ParamByName('vptr').Value :=0;
    open;
  end;
  with dm.ADOData0074A do
  while not eof do
  begin
    dm.ADOData0074.append;
    dm.ADOData0074.FieldByName('function_id').AsInteger :=FieldByName('function_id').AsInteger;
    dm.ADOData0074.FieldByName('user_rights').AsInteger :=FieldByName('user_rights').AsInteger;
    next;
  end ;
  dm.ADOData0074a.Close;
  dm.ADOData0073.Append;
  dm.ADOData0073.Fieldbyname('user_group_flag').asinteger:=1;
  dm.ADOData0073.Fieldbyname('ACTIVE_FLAG').asinteger:=0;
  dm.ADOData0073.Fieldbyname('LANGUAGE_FLAG').asstring:='C';
  dm.Adodata0073.fieldbyname('group_ptr').AsInteger :=vrkey;
  Application.CreateForm(TForm2, Form2);
  Form2.Edit7.text:=dm.ADOData0073.fieldbyname('user_password').asstring;
  Form2.showmodal;
  Form2.free;
  bar1.SimpleText:=copy(bar1.SimpleText,1,10);
end;

procedure TFrmMain.Edit1Exit(Sender: TObject);
begin
  if trim(edit1.Text)='' then
  begin
    dm.ADOData0073.Filter :='';
    exit;
  end;
  if not dm.ADO0073.Locate('user_id',trim(edit1.Text),[]) then
  begin
    messagedlg('该组别代号不存在！',mtinformation,[mbok],0);
    edit1.SetFocus;
  end else
  begin
    dm.ADOData0073.Filter :='group_ptr = '+dm.ADO0073.fieldbyname('rkey').AsString;
  end;
end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmGrp, FrmGrp);
  if FrmGrp.showmodal=mrok then
  begin
    dm.ADOData0073.Filter :='group_ptr = '+dm.ADO0073.fieldbyname('rkey').AsString;
    edit1.Text :=dm.ADO0073.fieldbyname('user_id').AsString;
  end;
  FrmGrp.Free;
end;

procedure TFrmMain.DBGrid1TitleClick(Column: TColumn);
begin
  if column.Index>1 then exit;
  if vindex<>column.Index then
  with dm.ADOData0073 do
  begin
    close ;
    sql.Delete(sql.Count-1);
    sql.Add('order by '+column.Field.FieldName);
    open;
  end;
  vindex:=column.Index;
  bar1.Panels[0].Text :='当前排序方式：'+column.Title.Caption;
  bar1.Panels[1].Text :='Searching:'
end;

procedure TFrmMain.RadioGroup1Click(Sender: TObject);
begin
  if dm.ADOData0073.parameters.ParamByName('vptr').Value<>Radiogroup1.ItemIndex then
  with dm.ADOData0073 do
  begin
    close;
    parameters.ParamByName('vptr').Value :=Radiogroup1.ItemIndex;
    open;
  end;
end;

end.

