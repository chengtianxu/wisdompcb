unit PasSetParameter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh;

type
  TFrmSetParameter = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    labName: TLabel;
    labUSER_LOGIN_NAME: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    ads57: TADODataSet;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label2: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    ads57iSort: TIntegerField;
    ads57d34Rkey: TIntegerField;
    ads57d278Rkey: TIntegerField;
    ads57ColName: TStringField;
    ads57DEPT_CODE: TStringField;
    ads57DEPT_NAME: TStringField;
    ads57PARAMETER_NAME: TStringField;
    ads57PARAMETER_DESC: TStringField;
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
      iNo:Integer;
  public
    { Public declarations }
  end;

var
  FrmSetParameter: TFrmSetParameter;

implementation

uses common,PasPublic,PasOrderParameter,Pick_Item_Single,ConstVar, PasDM;

{$R *.dfm}

procedure TFrmSetParameter.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'.. '9',#8,#13]) then Key:=#0;
end;

procedure TFrmSetParameter.BitBtn3Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  try
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'DEPT_CODE/工序代码/160,DEPT_NAME/工序名称/250';
    InputVar.Sqlstr :='select Rkey,DEPT_CODE,DEPT_NAME from dbo.data0034 where TType=1 order by DEPT_CODE';
    inputvar.KeyField:='DEPT_CODE';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit2.Text:=frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE'];
      labName.Caption:=frmPick_Item_Single.adsPick.FieldValues['DEPT_NAME'];
      Edit2.Tag:=frmPick_Item_Single.adsPick.FieldValues['Rkey'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmSetParameter.BitBtn1Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  if (Trim(Edit2.Text)='') then
  begin
    ShowMsg('请先选择工序代码！',1);
    Exit;
  end;
  try
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'PARAMETER_NAME/参数代码/160,PARAMETER_DESC/参数名称/250';
    InputVar.Sqlstr := 'select dbo.data0278.RKEY,dbo.data0278.PARAMETER_NAME,dbo.data0278.PARAMETER_DESC '+
                       ' from dbo.data0278 inner join'+
                       ' dbo.data0506 on dbo.data0278.Rkey= dbo.data0506.PARAMETER_PTR'+
                       ' where dbo.data0506.TTYPE=3 and dbo.data0506.SOURCE_PTR='+IntToStr(Edit2.Tag);
    InputVar.AdoConn := DM.ADOConnection1;
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

procedure TFrmSetParameter.BitBtn2Click(Sender: TObject);
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
  if (Trim(Edit2.Text)='') then
  begin
    ShowMsg('工序代码不能为空！',1);
    Exit;
  end;
  if (Trim(Edit1.Text)='') then
  begin
    ShowMsg('制成参数不能为空！',1);
    Exit;
  end;
  if (Trim(Edit2.Text)='') then
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
      tmpAdo.Connection:=dm.ADOConnection1;
      tmpAdo2:=TADOQuery.Create(Application);
      tmpAdo2.Connection:=dm.ADOConnection1;
      IFSingKey2(FIsInsert,'data0591','d34Rkey',IntToStr(Edit2.Tag),'d278Rkey='+IntTOStr(Edit1.Tag)+'',dm.ADOConnection1);
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='select * from data0591 where iSort='+Trim(Edit4.Text)+'';
      tmpAdo.Open;
      if (tmpAdo.RecordCount>0) then
      begin
        if (MessageBox(Handle,'该排列编号已经存在,'+#13+'确定重新全部排序吗?','重新排序提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO)	then exit;
        tmpAdo.Close;
        tmpAdo.SQL.Clear;
        tmpAdo.SQL.Text:='select * from data0591 where iSort>='+Trim(Edit4.Text)+' order by iSort';
        tmpAdo.Open;
        if (not tmpAdo.Eof) then
        begin
          tmpAdo.First;
          iOrder:=StrToInt(Edit4.Text);
          while not tmpAdo.Eof do
          begin
            tmpAdo2.Close;
            tmpAdo2.SQL.Clear;
            tmpAdo2.SQL.Text:='Update data0591 set iSort='+IntToStr(iOrder+i)+' where iSort='+tmpAdo.FieldBYName('iSort').AsString+'';
            tmpAdo2.ExecSQL;
            i:=i+1;
            tmpAdo.Next;
          end;
        end;
      end;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='Insert into data0591 (iSort,d34Rkey,d278Rkey,ColName) Values (:iSort,:d34Rkey,:d278Rkey,:ColName)';
      tmpAdo.Parameters.ParamByName('iSort').Value:=Edit4.Text;
      tmpAdo.Parameters.ParamByName('d34Rkey').Value:=Edit2.Tag;
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
    i:=1;
    try
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=dm.ADOConnection1;
      tmpAdo2:=TADOQuery.Create(Application);
      tmpAdo2.Connection:=dm.ADOConnection1;
      IFSingKey2(FIsInsert,'data0591','d34Rkey',IntToStr(Edit2.Tag),'d278Rkey='+IntTOStr(Edit1.Tag)+'',dm.ADOConnection1);
      iOrder:=StrToInt(Edit4.Text);
      if (iOrder<>iNo) then
      begin
        tmpAdo.Close;
        tmpAdo.SQL.Clear;
        tmpAdo.SQL.Text:='select * from data0591 where iSort='+Trim(Edit4.Text)+'';
        tmpAdo.Open;
        if (tmpAdo.RecordCount>0) then
        begin
          if (MessageBox(Handle,'该排列编号已经存在,'+#13+'确定重新全部排序吗?','重新排序提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO)	then exit;
          tmpAdo.Close;
          tmpAdo.SQL.Clear;
          tmpAdo.SQL.Text:='select * from data0591 where iSort>='+Trim(Edit4.Text)+' order by iSort';
          tmpAdo.Open;
          if (not tmpAdo.Eof) then
          begin
            tmpAdo.First;
            if (iNo-iOrder>0) then iOrder:=StrToInt(Edit4.Text);
            if (iNo-iOrder<0) then iOrder:=iNo;
            while not tmpAdo.Eof do
            begin
              if (iNo=tmpAdo.FieldByName('iSort').AsInteger) then tmpAdo.Next;
              tmpAdo2.Close;
              tmpAdo2.SQL.Clear;
              tmpAdo2.SQL.Text:='Update data0591 set iSort='+IntToStr(iOrder+i)+' where iSort='+tmpAdo.FieldBYName('iSort').AsString+'';
              tmpAdo2.ExecSQL;
              i:=i+1;
              tmpAdo.Next;
            end;
          end;
        end;
      end;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='Update data0591 set iSort=:iSort,d34Rkey=:d34Rkey,d278Rkey=:d278Rkey,ColName=:ColName where iSort=:iSort2';
      tmpAdo.Parameters.ParamByName('iSort').Value:=Edit4.Text;
      tmpAdo.Parameters.ParamByName('d34Rkey').Value:=Edit2.Tag;
      tmpAdo.Parameters.ParamByName('d278Rkey').Value:=Edit1.Tag;
      tmpAdo.Parameters.ParamByName('ColName').Value:=Edit3.Text;
      tmpAdo.Parameters.ParamByName('iSort2').Value:=iNo;
      tmpAdo.ExecSQL;
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
  if (not ads57.IsEmpty) then
  begin
    rkey:=ads57iSort.Value;
  end;
  ads57.Close;
  ads57.Open;
  if (not ads57.IsEmpty) then
  begin
    ads57.Last;
    Edit2.Text:='';
    Edit1.Text:='';
    Edit3.Text:='';
    Edit4.Text:=IntToStr(ads57iSort.AsInteger+1);
  end;
  if (not ads57.IsEmpty) then ads57.Locate('iSort',rkey,[]);
end;

procedure TFrmSetParameter.FormShow(Sender: TObject);
var tmpAdo:TADOQuery;
begin
  try
    tmpAdo:=TADOQuery.Create(Application);
    tmpAdo.Connection:=dm.ADOConnection1;
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Text:='select * from data0591 order by iSort';
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
  ads57.Open;
end;

procedure TFrmSetParameter.N1Click(Sender: TObject);
var tmpAdo:TADOQuery;
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  if (not ads57.IsEmpty) then
  begin
    try
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=dm.ADOConnection1;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='delete data0591 where iSort='+ads57iSort.AsString;
      tmpAdo.ExecSQL;
      self.ads57.Close;
      self.ads57.Open;
    finally
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
      tmpAdo:=nil;
    end;
  end;
end;

end.
