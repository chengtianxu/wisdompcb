unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls,
  ComCtrls, DBGridEh, Menus, DB, ADODB, DBCtrlsEh;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    BtnSave: TBitBtn;
    MaskEdit1: TMaskEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    sGrd1: TStringGrid;
    SGrd2: TStringGrid;
    DBCheckBoxEh1: TDBCheckBoxEh;
    Panel4: TPanel;
    ScrollBox1: TScrollBox;
    Panel5: TPanel;
    Panel6: TPanel;
    PageControl6: TPageControl;
    TabSheet6: TTabSheet;
    DBMemo4: TDBMemo;
    PageControl8: TPageControl;
    TabSheet8: TTabSheet;
    DBMemo6: TDBMemo;
    PageControl4: TPageControl;
    TabSheet4: TTabSheet;
    DBMemo2: TDBMemo;
    Panel7: TPanel;
    PageControl7: TPageControl;
    TabSheet7: TTabSheet;
    DBMemo5: TDBMemo;
    PageControl5: TPageControl;
    TabSheet5: TTabSheet;
    DBMemo3: TDBMemo;
    PageControl9: TPageControl;
    TabSheet9: TTabSheet;
    DBMemo7: TDBMemo;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    PageControl3: TPageControl;
    TabSheet3: TTabSheet;
    DBMemo1: TDBMemo;
    SpeedButton1: TSpeedButton;
    procedure BitBtn9Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public
    Ftag:integer;
    procedure initd;
  end;

  procedure split(var str:string;SGrd: TStringGrid);
  procedure split2(var str:string;SGrd: TStringGrid);

implementation
  uses common,DM_u,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TFrm_detail.initd;
var sVit:string;
     i:integer;
begin
  SGrd1.Cells[0,0]:='姓名';
  SGrd1.Cells[1,0]:='部门';
  SGrd1.Cells[2,0]:='职务';
  SGrd2.Cells[0,0]:='姓名';
  SGrd2.Cells[1,0]:='部门';
  SGrd2.Cells[2,0]:='职务';
  SGrd2.Cells[3,0]:='手机';

  if Ftag=0 then
  begin
    self.Caption:='拜访客户日志-新增';
    DM.GetNo(MaskEdit1,'68',0);

    DM.ADO721_1.Close;
    DM.ADO721_1.Parameters[0].Value:=-1;
    DM.ADO721_1.Open;
    DM.ADO721_1.Append;

    DM.tmp.Close;
    DM.tmp.SQL.Text:='select getdate()';
    DM.tmp.Open;
    DM.ADO721_1.FieldByName('VistDate').AsDateTime:=DM.tmp.Fields[0].AsDateTime;

  end else begin
    self.Caption:='拜访客户日志-修改';
    MaskEdit1.ReadOnly:=true;
    DM.ADO721_1.Close;
    DM.ADO721_1.Parameters[0].Value:=DM.ADO721rkey.Value;
    DM.ADO721_1.Open;

    sVit:=DM.ADO721_1.FieldByName('visitors').AsString;
    split(sVit, SGrd1);
    sVit:=DM.ADO721_1.FieldByName('visitedMan').AsString;
    if (SGrd2.ColCount=4) then
    split2(sVit, SGrd2)
    else
    split(sVit, SGrd2);

    MaskEdit1.Text:=DM.ADO721_1.Fieldbyname('LogNo').AsString;
  end;

  for i:=0 to self.ComponentCount-1 do
    if self.Components[i] is TDBMemo then
      TDBMemo(self.Components[i]).MaxLength:=TDBMemo(self.Components[i]).Field.Size;
end;

procedure TFrm_detail.BtnSaveClick(Sender: TObject);
var sVit:string;
    i:integer;
begin
  if MaskEdit1.Text='' then
  begin
    showmessage('申请单号不能为空...');
    exit;
  end;
  if DBEdit1.Text='' then
  begin
    showmessage('客户名称不能为空...');
    exit;
  end;
  if DBEdit2.Text='' then
  begin
    showmessage('拜访地点不能为空...');
    exit;
  end;

  DM.ADO721_1.Edit;
  DM.ADO721_1.FieldByName('salesID').AsString:=rkey73;

  DM.ADO721_1.FieldByName('status').AsInteger:=0;
  DM.ADOCon.BeginTrans;
  try
    if (Ftag=0)  and not DM.GetNo(MaskEdit1,'68',1) then  abort;
    DM.ADO721_1.FieldByName('LogNo').AsString:=MaskEdit1.Text;
    sVit:='';
    for i:=1 to 5 do
    begin
      if sGrd1.Cells[0,i]<>'' then sVit:=sVit+sGrd1.Cells[0,i]+'&'+sGrd1.Cells[1,i]+'&'+sGrd1.Cells[2,i]+'&' else break;
    end;
    DM.ADO721_1.FieldByName('visitors').AsString:=copy(sVit,1,length(sVit)-1);

    sVit:='';
    for i:=1 to 5 do
    begin
      if sGrd2.Cells[0,i]<>'' then sVit:=sVit+sGrd2.Cells[0,i]+'&'+sGrd2.Cells[1,i]+'&'+sGrd2.Cells[2,i]+'&'+sGrd2.Cells[3,i]+'&' else break;
    end;
    DM.ADO721_1.FieldByName('visitedMan').AsString:=copy(sVit,1,length(sVit)-1);

    DM.ADO721_1.Post;
    DM.ADO721_1.UpdateBatch(arAll);
    DM.ADOCon.CommitTrans;
    Frkey721:=DM.ADO721_1.FieldByName('rkey').asinteger;
    modalresult:=mrok;
  except
    DM.ADOCon.RollbackTrans;
    showmessage('保存数据失败...');
  end;
end;

procedure TFrm_detail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_return) and not (self.ActiveControl is TDBMemo) then
    self.SelectNext(self.ActiveControl,true,true);
end;

procedure TFrm_detail.BitBtn9Click(Sender: TObject);
begin
  close;
end;


procedure split(var str: string; SGrd: TStringGrid);
var i,x,y:integer;
begin
  for y:=1 to SGrd.RowCount-2 do
    for x:=0 to 2 do SGrd.Cells[x,y]:='';
  if str='' then exit;
  x:=0;y:=1;
  i:=pos('&',str);
  while i<>0 do
  begin
    SGrd.Cells[x,y]:=copy(str,1,i-1);
    str:=copy(str,i+1,length(str)-i);
    inc(x);
    if x=3 then begin inc(y);x:=0;end;
    i:=pos('&',str);
  end;
  SGrd.Cells[x,y]:=str;
end;
procedure split2(var str: string; SGrd: TStringGrid);
var i,x,y:integer;
begin
  for y:=1 to SGrd.RowCount-2 do
    for x:=0 to 3 do SGrd.Cells[x,y]:='';
  if str='' then exit;
  x:=0;y:=1;
  i:=pos('&',str);
  while i<>0 do
  begin
    SGrd.Cells[x,y]:=copy(str,1,i-1);
    str:=copy(str,i+1,length(str)-i);
    inc(x);
    if x=4 then begin inc(y);x:=0;end;
    i:=pos('&',str);
  end;
  SGrd.Cells[x,y]:=str;
end;

procedure TFrm_detail.SpeedButton1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'cust_code/客户代码/100,customer_name/客户全称/200,abbr_name/客户简称/150';
    InputVar.Sqlstr := 'select cust_code,customer_name,abbr_name from data0010 order by 1';
    InputVar.AdoConn := DM.ADOCon;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      DM.ADO721_1.Edit;
      DBEdit1.Field.AsString := frmPick_Item_Single.adsPick.FieldValues['customer_name'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;

end;

end.
