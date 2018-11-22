unit UDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, ComCtrls, Mask, DBCtrls, DBCtrlsEh,
  Grids, Buttons,Spin, DBGrids,DBGridEh, Menus, DB, ADODB;

type
  TDetail_Form = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    SGrd2: TStringGrid;
    SGrd1: TStringGrid;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBMemo1: TDBMemo;
    Label9: TLabel;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    Label10: TLabel;
    Label11: TLabel;
    DBMemo4: TDBMemo;
    Label12: TLabel;
    DBMemo5: TDBMemo;
    Label13: TLabel;
    DBMemo6: TDBMemo;
    Panel5: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    DBMemo7: TDBMemo;
    Label16: TLabel;
    DBMemo8: TDBMemo;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    Label21: TLabel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Panel3: TPanel;
    Label4: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    BtnSave: TBitBtn;
    BitBtn9: TBitBtn;
    SpeedButton1: TSpeedButton;
    DBCheckBoxEh1: TDBCheckBoxEh;
    Label22: TLabel;
    Bevel2: TBevel;
    DBMemo10: TDBMemo;
    Panel6: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBMemo9: TDBMemo;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    DBEdit3: TDBEdit;
    procedure PageControl1DrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure BtnSaveClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
  private

    { Private declarations }
  public
    Ftag:integer;
    procedure initd;
    { Public declarations }
  end;
      procedure split(var str:string;SGrd: TStringGrid);
var
  Detail_Form: TDetail_Form;

implementation

uses Udm,COMMON,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TDetail_Form.initd;
var sVit:string;
begin
  SGrd1.Cells[0,0]:='姓名';
  SGrd1.Cells[1,0]:='部门';
  SGrd1.Cells[2,0]:='职务';
  SGrd2.Cells[0,0]:='姓名';
  SGrd2.Cells[1,0]:='部门';
  SGrd2.Cells[2,0]:='职务';

  if Ftag=0 then
  begin
    self.Caption:='拜访客户日志-新增';
    DM.GetNo(MaskEdit1,'76',0);

    DM.ADO722_1.Close;
    DM.ADO722_1.Parameters[0].Value:=-1;
    DM.ADO722_1.Open;
    DM.ADO722_1.Append;

    DM.tmp.Close;
    DM.tmp.SQL.Text:='select getdate()';
    DM.tmp.Open;
    DM.ADO722_1.FieldByName('VistDate').AsDateTime:=DM.tmp.Fields[0].AsDateTime;
    Panel6.Visible := false;
   
  end else
      begin
      if  Ftag=1 then
        begin
          self.Caption:='拜访客户日志-修改';
          MaskEdit1.ReadOnly:=true;
          DM.ADO722_1.Close;
          DM.ADO722_1.Parameters[0].Value:=DM.ADO722rkey.Value;
          DM.ADO722_1.Open;

          sVit:=DM.ADO722_1.FieldByName('visitors').AsString;
          split(sVit, SGrd1);
          sVit:=DM.ADO722_1.FieldByName('visitedMan').AsString;
          split(sVit, SGrd2);
          Panel6.Visible := false;
          MaskEdit1.Text:=DM.ADO722_1.Fieldbyname('LogNo').AsString;
        end
      else
        if  Ftag=7 then
        begin
         self.Caption:='拜访客户日志-查看';
          MaskEdit1.ReadOnly:=true;
          DM.ADO722_1.Close;
          DM.ADO722_1.Parameters[0].Value:=DM.ADO722rkey.Value;
          DM.ADO722_1.Open;
          BtnSave.Enabled := false;
          sVit:=DM.ADO722_1.FieldByName('visitors').AsString;
          split(sVit, SGrd1);
          sVit:=DM.ADO722_1.FieldByName('visitedMan').AsString;
          split(sVit, SGrd2);
          Panel6.Visible := true;
          MaskEdit1.Text:=DM.ADO722_1.Fieldbyname('LogNo').AsString;
         end;
      end;

{ for i:=0 to self.ComponentCount-1 do
    if self.Components[i] is TDBMemo then
      TDBMemo(self.Components[i]).MaxLength:=TDBMemo(self.Components[i]).Field.Size;  }
end;

procedure TDetail_Form.PageControl1DrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
{    if Active then
    begin
    Control.Canvas.Brush.Color:=clWhite;
    Control.Canvas.Font.Color:=clBlack;
    end
    else
    begin
    Control.Canvas.Brush.Color:=clBtnFace;
    Control.Canvas.Font.Color:=clBlack;
    end;
    Control.Canvas.FillRect(Rect);
    Control.Canvas.TextOut(Rect.Left+3, Rect.Top+3, PageControl1.Pages[TabIndex].Caption);}
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

procedure TDetail_Form.BtnSaveClick(Sender: TObject);
var sVit:string;
    i:integer;
begin
  if MaskEdit1.Text='' then
  begin
    showmessage('日志单号不能为空...');
    exit;
  end;
  if DBEdit1.Text='' then
  begin
    showmessage('客户名称不能为空...');
    DBEdit1.SetFocus;
    exit;
  end;

  DM.ADO722_1.Edit;
  DM.ADO722_1.FieldByName('ReportID').AsString:= rkey73;
  DM.ADO722_1.FieldByName('isUpdate').Value := DBCheckBoxEh1.Checked;
  DM.ADO722_1.FieldByName('status').AsInteger:=0;
  DM.ADOConnection1.BeginTrans;
  try
    if (Ftag=0)  and not DM.GetNo(MaskEdit1,'76',1) then  abort;
    DM.ADO722_1.FieldByName('LogNo').AsString:=MaskEdit1.Text;
    sVit:='';
    for i:=1 to 5 do
    begin
      if sGrd1.Cells[0,i]<>'' then sVit:=sVit+sGrd1.Cells[0,i]+'&'+sGrd1.Cells[1,i]+'&'+sGrd1.Cells[2,i]+'&' else break;
    end;
    DM.ADO722_1.FieldByName('visitors').AsString:=copy(sVit,1,length(sVit)-1);

    sVit:='';
    for i:=1 to 5 do
    begin
      if sGrd2.Cells[0,i]<>'' then sVit:=sVit+sGrd2.Cells[0,i]+'&'+sGrd2.Cells[1,i]+'&'+sGrd2.Cells[2,i]+'&' else break;
    end;
    DM.ADO722_1.FieldByName('visitedMan').AsString:=copy(sVit,1,length(sVit)-1);
    DM.ADO722_1.FieldByName('Ent_Date').AsDateTime:= now;
    DM.ADO722_1.Post;
    DM.ADO722_1.UpdateBatch(arAll);
    DM.ADOConnection1.CommitTrans;
    Frkey722:=DM.ADO722_1.FieldByName('rkey').asinteger;

    modalresult:=mrok;
  except
    DM.ADOConnection1.RollbackTrans;
    showmessage('保存数据失败...');
  end;
end;

procedure TDetail_Form.SpeedButton1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'cust_code/客户代码/100,customer_name/客户全称/200,abbr_name/客户简称/150';
    InputVar.Sqlstr := 'select cust_code,customer_name,abbr_name from data0010 order by 1';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      DM.ADO722_1.Edit;
      DBEdit1.Field.AsString := frmPick_Item_Single.adsPick.FieldValues['customer_name'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;

end;

procedure TDetail_Form.BitBtn9Click(Sender: TObject);
begin
close;
end;

end.
