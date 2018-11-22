unit Frm_Edit_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TFrm_Edit = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    SGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    SGrid2: TStringGrid;
    procedure BitBtn2Click(Sender: TObject);
    procedure SGrid1Enter(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    Grd:TStringGrid;

  public
    Ftag:integer;//0 add,1 edit
    procedure init;
  end;

var
  Frm_Edit: TFrm_Edit;

implementation
uses dm_u,Frm_UserSelect_u;
{$R *.dfm}

procedure TFrm_Edit.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_Edit.init;
var i:integer;
begin
  SGrid1.Cells[0,0]:='操作员代码';
  SGrid1.Cells[1,0]:='操作员名称';
  SGrid1.Cells[2,0]:='rkey73';
  SGrid1.ColWidths[2]:=-1;
  
  SGrid2.Cells[0,0]:='操作员代码';
  SGrid2.Cells[1,0]:='操作员名称';
  SGrid2.Cells[2,0]:='rkey73';
  SGrid2.ColWidths[2]:=-1;

  if Ftag=1 then   //edit
  begin
    Edit1.Text:=DM.ADOData720_1GrpName.AsString;
    DM.ADOData720_2.First;
    i:=1;
    while not DM.ADOData720_2.Eof do
    begin
      SGrid1.Cells[0,i]:=DM.ADOData720_2user_login_name.AsString;
      SGrid1.Cells[1,i]:=Dm.ADOData720_2user_full_name.AsString;
      SGrid1.Cells[2,i]:=Dm.ADOData720_2rkey73.AsString;
      inc(i);
      DM.ADOData720_2.Next;
      SGrid1.RowCount:=SGrid1.RowCount+1;
    end;

    DM.ADOData720_3.First;
    i:=1;
    while not DM.ADOData720_3.Eof do
    begin
      SGrid2.Cells[0,i]:=DM.ADOData720_3user_login_name.AsString;
      SGrid2.Cells[1,i]:=Dm.ADOData720_3user_full_name.AsString;
      SGrid2.Cells[2,i]:=Dm.ADOData720_3rkey73.AsString;
      inc(i);
      DM.ADOData720_3.Next;
      SGrid2.RowCount:=SGrid2.RowCount+1;
    end;
  end;
end;

procedure TFrm_Edit.SGrid1Enter(Sender: TObject);
begin
  Grd:=TStringGrid(Sender);
end;

procedure TFrm_Edit.PopupMenu1Popup(Sender: TObject);
begin
  N2.Enabled:=not ((Grd.Row=0) or (Grd.Row=Grd.RowCount-1));
end;

procedure TFrm_Edit.N1Click(Sender: TObject);
var i:integer;
    s:string;
begin
  with TFrm_UserSelect.Create(nil) do
  try
    s:='';
    for i:=1 to Grd.RowCount-2 do
      s:=s+Grd.Cells[2,i]+',';   //rkey73 唯一
    s:=s+'0';
    DM.tmp.Close;
    DM.tmp.SQL.Text:='SELECT cast(0 as bit )isSel,dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME,'+
                    'dbo.Data0073.USER_LOGIN_NAME,dbo.Data0073.USER_FULL_NAME,dbo.Data0073.rkey rkey73 '+
                    'FROM dbo.Data0073 INNER JOIN '+
                    'dbo.Data0005 ON dbo.Data0073.EMPLOYEE_PTR = dbo.Data0005.RKEY AND '+
                    'dbo.Data0073.EMPLOYEE_PTR = dbo.Data0005.RKEY INNER JOIN '+
                    'dbo.Data0034 ON dbo.Data0005.EMPLOYEE_ID = dbo.Data0034.RKEY '+
                    'WHERE dbo.Data0073.ACTIVE_FLAG = 0 and data0073.rkey not in ('+s+
                    ') order by dbo.Data0073.USER_LOGIN_NAME';

    DM.tmp.Open;
    for i:=0 to DM.tmp.Fields.Count-1 do DM.tmp.Fields[i].ReadOnly:=i<>0;
    ClientDataSet1.Data:=DataSetProvider1.Data;
    if showmodal=mrok then
    begin
      ClientDataSet1.OnFilterRecord:=nil;
      ClientDataSet1.Filter:='isSel=1';
      ClientDataSet1.Filtered:=true;
      ClientDataSet1.First;
      i:=Grd.RowCount-1;
      while not ClientDataSet1.Eof do
      begin
        Grd.Cells[0,i]:=ClientDataSet1.fieldbyname('user_login_name').AsString;
        Grd.Cells[1,i]:=ClientDataSet1.fieldbyname('user_full_name').AsString;
        Grd.Cells[2,i]:=ClientDataSet1.fieldbyname('rkey73').AsString;
        inc(i);
        Grd.RowCount:=Grd.RowCount+1;
        ClientDataSet1.Next;
      end;
    end;
  finally
    free;
    DM.tmp.Close;
  end;
end;

procedure TFrm_Edit.N2Click(Sender: TObject);
var
 i:integer;
begin
  if Grd.RowCount <= 2 then exit;
  for i:=Grd.Row to Grd.RowCount-2 do Grd.Rows[i].Text:=Grd.Rows[i+1].Text;
  Grd.RowCount:=Grd.RowCount-1;
end;

procedure TFrm_Edit.BitBtn1Click(Sender: TObject);
var i:integer;
begin
  if Edit1.Text='' then
  begin
    showmessage('业务组名称不能为空!');
    exit;
  end;
  if Ftag=0 then //add
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select top 1 rkey from data0720 where GrpName='''+Edit1.Text+'''';
    DM.tmp.Open;
    if not DM.tmp.IsEmpty  then
    begin
      showmessage('业务组名称已经存在!');
      exit;
    end;
  end;
  if (SGrid1.RowCount=2) and (SGrid2.RowCount=2) then
  begin
    showmessage('不能保存空记录!');
    exit;
  end;

  try
    DM.ADOCon.BeginTrans;
    DM.tmp.Close;
    if Ftag=1 then //Edit
    begin
      DM.tmp.SQL.Text:='delete from data0720 where GrpName='''+DM.ADOData720_1GrpName.Value+'''';
      DM.tmp.ExecSQL;
    end;

    for i:=1 to SGrid1.RowCount-2 do
    begin
      DM.tmp.SQL.Text:='insert into data0720 (GrpName,rkey73,ttype) values('''+Edit1.Text+''','+SGrid1.Cells[2,i]+',0)';
      DM.tmp.ExecSQL;
    end;
    for i:=1 to SGrid2.RowCount-2 do
    begin
      DM.tmp.SQL.Text:='insert into data0720 (GrpName,rkey73,ttype) values('''+Edit1.Text+''','+SGrid2.Cells[2,i]+',1)';
      DM.tmp.ExecSQL;
    end;
    DM.ADOCon.CommitTrans;
    modalresult:=mrok;
  except
    DM.ADOCon.RollbackTrans;
    showmessage('数据保存发生错误...');
  end;
end;

end.
