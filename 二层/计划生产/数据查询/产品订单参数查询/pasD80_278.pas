unit pasD80_278;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh;

type
  TfrmD80_278 = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    labName: TLabel;
    labUSER_LOGIN_NAME: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Edit3: TEdit;
    Edit4: TEdit;
    ads80: TADODataSet;
    ads80iSort: TIntegerField;
    ads80d278Rkey: TIntegerField;
    ads80ColName: TStringField;
    ads80PARAMETER_NAME: TStringField;
    ads80PARAMETER_DESC: TStringField;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
      iNo:Integer;
  public
    { Public declarations }
  end;

var
  frmD80_278: TfrmD80_278;

implementation

uses common,PasPublic,PasOrderParameter,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TfrmD80_278.BitBtn1Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  try
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'PARAMETER_NAME/参数代码/160,PARAMETER_DESC/参数名称/250';
    InputVar.Sqlstr := 'select dbo.data0278.RKEY,dbo.data0278.PARAMETER_NAME,dbo.data0278.PARAMETER_DESC '+
                       ' from dbo.data0278 '+
                       ' where dbo.data0278.CATEGORY_PTR=2';
    InputVar.AdoConn := FrmOrderParameter.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit1.Text:=frmPick_Item_Single.adsPick.FieldValues['PARAMETER_NAME'];
      Edit3.Text:=frmPick_Item_Single.adsPick.FieldValues['PARAMETER_DESC'];
      Edit1.Tag:=frmPick_Item_Single.adsPick.FieldValues['RKEY'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TfrmD80_278.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'.. '9',#8,#13]) then Key:=#0;
end;

procedure TfrmD80_278.FormShow(Sender: TObject);
var tmpAdo:TADOQuery;
begin
  try
    tmpAdo:=TADOQuery.Create(Application);
    tmpAdo.Connection:=FrmOrderParameter.ADOConnection1;
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Text:='select * from dbo.data0080 order by iSort';
    tmpAdo.Open;
    if (not tmpAdo.IsEmpty) then
    begin
      tmpAdo.Last;
      Edit4.Text:=IntToStr(tmpAdo.FieldByName('iSort').AsInteger+1);
    end else
    begin
      Edit4.Text:='1';
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
  ads80.Open;
end;

procedure TfrmD80_278.BitBtn2Click(Sender: TObject);
var tmpAdo,tmpAdo2:TADOQuery;
    FIsInsert:Boolean;
    iOrder,i,iNumber:Integer;
    rkey:integer;
begin
  if (Trim(Edit4.Text)='') then
  begin
    ShowMsg('排列编号不能为空！',1);
    Exit;
  end;
  if (Trim(Edit1.Text)='') then
  begin
    ShowMsg('全局参数不能为空！',1);
    Exit;
  end;
  if (Trim(Edit3.Text)='') then
  begin
    ShowMsg('列名标题不能为空！',1);
    Exit;
  end;
  if (Q_Ftp=0) then
  begin
    FIsInsert := True;
    iOrder:=0;
    i:=1;
    try
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=FrmOrderParameter.ADOConnection1;
      tmpAdo2:=TADOQuery.Create(Application);
      tmpAdo2.Connection:=FrmOrderParameter.ADOConnection1;
      IFSingKey2(FIsInsert,'dbo.data0080','d278Rkey',IntToStr(Edit1.Tag),'',FrmOrderParameter.ADOConnection1);
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='select * from dbo.data0080 where iSort='+Trim(Edit4.Text)+'';
      tmpAdo.Open;
      if (tmpAdo.RecordCount>0) then
      begin
        if (MessageBox(Handle,'该排列编号已经存在,'+#13+'确定重新全部排序吗?','重新排序提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO)	then exit;
        tmpAdo.Close;
        tmpAdo.SQL.Clear;
        tmpAdo.SQL.Text:='select * from dbo.data0080 where iSort>='+Trim(Edit4.Text)+' order by iSort desc';
        tmpAdo.Open;
        if (not tmpAdo.IsEmpty) then
        begin
          tmpAdo.First;
          while not tmpAdo.Eof do
          begin
            tmpAdo2.Close;
            tmpAdo2.SQL.Clear;
            tmpAdo2.SQL.Text:='Update dbo.Data0080 set iSort='+IntToStr(tmpAdo.FieldBYName('iSort').AsInteger+1)+' where iSort='+tmpAdo.FieldBYName('iSort').AsString+'';
            tmpAdo2.ExecSQL;
            tmpAdo.Next;
          end;
        end;
      end;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='Insert into dbo.data0080 (iSort,d278Rkey,ColName) Values (:iSort,:d278Rkey,:ColName)';
      tmpAdo.Parameters.ParamByName('iSort').Value:=Edit4.Text;
      tmpAdo.Parameters.ParamByName('d278Rkey').Value:=Edit1.Tag;
      tmpAdo.Parameters.ParamByName('ColName').Value:=Edit3.Text;
      tmpAdo.ExecSQL;
      ShowMsg('保存成功！',1);
    finally
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
      tmpAdo2.Close;
      tmpAdo2.Connection:=nil;
      tmpAdo2.Free;
    end;
  end else
  if (Q_Ftp=1) then
  begin
    FIsInsert := False;
    iOrder:=0;
    try
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=FrmOrderParameter.ADOConnection1;
      tmpAdo2:=TADOQuery.Create(Application);
      tmpAdo2.Connection:=FrmOrderParameter.ADOConnection1;
      IFSingKey2(FIsInsert,'dbo.data0080','d278Rkey',IntToStr(Edit1.Tag),'',FrmOrderParameter.ADOConnection1);
      if (iOrder<>iNo) then
      begin
        tmpAdo.Close;
        tmpAdo.SQL.Clear;
        tmpAdo.SQL.Text:='select * from dbo.data0080 where iSort='+Trim(Edit4.Text)+'';
        tmpAdo.Open;
        if (tmpAdo.RecordCount>0) then
        begin
          if (MessageBox(Handle,'该排列编号已经存在,'+#13+'确定重新全部排序吗?','重新排序提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO)	then exit;
          iOrder:=StrToInt(Edit4.Text);
          tmpAdo.Close;
          tmpAdo.SQL.Clear;
          tmpAdo.SQL.Text:='select * from dbo.data0080 where iSort>'+Trim(Edit4.Text)+' order by iSort';
          tmpAdo.Open;
          if (not tmpAdo.IsEmpty) then
          begin
            tmpAdo.First;
            while not tmpAdo.Eof do
            begin
              tmpAdo2.Close;
              tmpAdo2.SQL.Clear;
              tmpAdo2.SQL.Text:='Update dbo.Data0080 set iSort='+IntToStr(iOrder+1)+' where iSort='+tmpAdo.FieldBYName('iSort').AsString+'';
              tmpAdo2.ExecSQL;
              iOrder:=iOrder+1;
              tmpAdo.Next;
            end;
          end;
        end;
      end;
//      tmpAdo.Close;
//      tmpAdo.SQL.Clear;
//      tmpAdo.SQL.Text:='Update dbo.data0080 set iSort=:iSort,d278Rkey=:d278Rkey,ColName=:ColName where iSort=:iSort2';
//      tmpAdo.Parameters.ParamByName('iSort').Value:=Edit4.Text;
//      tmpAdo.Parameters.ParamByName('d278Rkey').Value:=Edit1.Tag;
//      tmpAdo.Parameters.ParamByName('ColName').Value:=Edit3.Text;
//      tmpAdo.Parameters.ParamByName('iSort2').Value:=iNo;
//      tmpAdo.ExecSQL;
      ShowMsg('修改成功！',1);
    finally
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
      tmpAdo2.Close;
      tmpAdo2.Connection:=nil;
      tmpAdo2.Free;
    end;
  end;
  if (not ads80.IsEmpty) then
  begin
    rkey:=ads80iSort.Value;
  end;
  ads80.Close;
  ads80.Open;
  if (not ads80.IsEmpty) then
  begin
    ads80.Last;
    Edit1.Text:='';
    Edit3.Text:='';
    Edit4.Text:=IntToStr(ads80iSort.AsInteger+1);
  end;
  if (not ads80.IsEmpty) then ads80.Locate('iSort',rkey,[]);
end;

procedure TfrmD80_278.N1Click(Sender: TObject);
var tmpAdo,tmpAdo2:TADOQuery;
    iNo:Integer;
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (not ads80.IsEmpty) then
  begin
    try
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=FrmOrderParameter.ADOConnection1;
      tmpAdo2:=TADOQuery.Create(Application);
      tmpAdo2.Connection:=FrmOrderParameter.ADOConnection1;
      iNo:=ads80iSort.AsInteger;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='delete data0080 where iSort='+ads80iSort.AsString;
      tmpAdo.ExecSQL;
      tmpAdo.close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='select * from dbo.data0080 where isort>'+IntToStr(iNo)+' order by iSort';
      tmpAdo.Open;
      if (not tmpAdo.IsEmpty) then
      begin
        tmpAdo.First;
        while not tmpAdo.Eof do
        begin
          tmpAdo2.Close;
          tmpAdo2.SQL.Clear;
          tmpAdo2.SQL.Text:='update data0080 set iSort='+IntToStr(iNo)+' where iSort='+tmpAdo.FieldBYName('iSort').AsString;
          iNo:=iNo+1;
          tmpAdo2.ExecSQL;
          tmpAdo.Next;
        end;
      end;
      self.ads80.Close;
      self.ads80.Open;
      FormShow(nil);
    finally
      tmpAdo2.Close;
      tmpAdo2.Connection:=nil;
      tmpAdo2.Free;
      tmpAdo2:=nil;
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
      tmpAdo:=nil;
    end;
  end;
end;

end.
