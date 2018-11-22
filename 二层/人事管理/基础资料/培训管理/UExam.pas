unit UExam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, DB, ADODB;

type
  TfrmExam = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    ds1: TDataSource;
    qry1: TADOQuery;
    btnLast: TButton;
    btnNext: TButton;
    btn_Commit: TButton;
    chkA: TCheckBox;
    chkB: TCheckBox;
    chkC: TCheckBox;
    chkD: TCheckBox;
    intgrfldqry1TC_ptr: TIntegerField;
    fltfldqry1AScore: TFloatField;
    atncfldqry1rkey: TAutoIncField;
    intgrfldqry1M_ptr: TIntegerField;
    intgrfldqry1PType: TIntegerField;
    intgrfldqry1PNo: TIntegerField;
    strngfldqry1PContent: TStringField;
    strngfldqry1A: TStringField;
    strngfldqry1B: TStringField;
    strngfldqry1C: TStringField;
    strngfldqry1D: TStringField;
    strngfldqry1PRight: TStringField;
    lbl1: TLabel;
    dbtxtNO: TDBText;
    fltfldqry1Ascore_1: TFloatField;
    fltfldqry1RScore: TFloatField;
    strngfldqry1sel: TStringField;
    dbmmoPContent: TDBMemo;
    lbl2: TLabel;
    dbtxtA: TDBMemo;
    dbtxtB: TDBMemo;
    dbtxtC: TDBMemo;
    dbtxtD: TDBMemo;
    procedure btnLastClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkAClick(Sender: TObject);
    procedure chkBClick(Sender: TObject);
    procedure chkCClick(Sender: TObject);
    procedure chkDClick(Sender: TObject);
    procedure btn_CommitClick(Sender: TObject);
    procedure dbtxtA1Click(Sender: TObject);
    procedure dbtxtBClick(Sender: TObject);
    procedure dbtxtCClick(Sender: TObject);
    procedure dbtxtDClick(Sender: TObject);
  private
    { Private declarations }

    procedure  GetPaperOne;
  public
    { Public declarations }
    FAScore:double;
  end;

var
  frmExam: TfrmExam;

implementation
   uses udm;
{$R *.dfm}

procedure TfrmExam.btnLastClick(Sender: TObject);
begin
 if qry1.FieldByName('Pno').AsInteger>1 then
 begin
  qry1.Prior;
  GetPaperONe;
 end
 else
 begin
 ShowMessage('已经是第一题！');
 end;
end;

procedure TfrmExam.btnNextClick(Sender: TObject);
 var
   LCount :integer;
begin
 if  qry1.FieldByName('Pno').AsInteger<qry1.RecordCount then
 begin
   qry1.Next;
   GetPaperONe;
 end
 else
 begin
  if  MessageDlg('已到最后一题，需要结束考试提交试卷吗？',mtConfirmation,[mbYes,mbno],0)=mrYes  then
  begin
  btn_CommitClick(btn_Commit);
  end;
 end;
end;

procedure TfrmExam.FormShow(Sender: TObject);
begin
  FAScore:=0;
  GetPaperOne;
end;

procedure TfrmExam.GetPaperOne;
begin
  chkA.Checked:=false;
  chkB.Checked:=false;
  chkC.Checked:=false;
  chkD.Checked:=false;

 if qry1.FieldByName('PType').Value=0 then  //判断题
  begin
  chkC.Visible:=false;
  chkD.Visible:=false;

  dbtxtC.Visible:=false;
  dbtxtD.Visible:=false;
  end
  else  if qry1.FieldByName('PType').Value=1 then  //选择题
  begin
  chkC.Visible:=true;
  chkD.Visible:=true;

  dbtxtC.Visible:=true;
  dbtxtD.Visible:=true;
  end ;
    if qry1.FieldByName('sel').Value='A' then
  chkA.Checked:=true
  else if qry1.FieldByName('sel').Value='B' then
  chkB.Checked:=true
  else if qry1.FieldByName('sel').Value='C' then
  chkC.Checked:=true
  else if qry1.FieldByName('sel').Value='D' then
  chkD.Checked:=true;
end;

procedure TfrmExam.chkAClick(Sender: TObject);
begin
 if chkA.Checked=True then
 begin
   qry1.Edit;
   qry1.FieldByName('sel').Value:='A';
   qry1.post;

   if chkB.Checked=true  then chkB.Checked:=False;
   if chkC.Checked=true  then chkC.Checked:=False;
   if chkD.Checked=true  then chkD.Checked:=False;

   if  qry1.fieldbyname('PRight').Value='A' then
   begin
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:= qry1.fieldbyname('AScore_1').Value;
   //qry1.FieldByName('sel').Value:='A';
   qry1.post;
   end
   else
   begin
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:=0;
   qry1.post;
   end;
 end
 else
 begin
 qry1.Edit;
 qry1.fieldbyname('RScore').Value:=0;
 qry1.post;
 end;

end;

procedure TfrmExam.chkBClick(Sender: TObject);
begin
 if chkB.Checked=True then
 begin
   if chkA.Checked=true  then chkA.Checked:=False;
   if chkC.Checked=true  then chkC.Checked:=False;
   if chkD.Checked=true  then chkD.Checked:=False;

   qry1.Edit;
   qry1.FieldByName('sel').Value:='B';
   qry1.post;

   if  qry1.fieldbyname('PRight').Value='B' then
   begin
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:= qry1.fieldbyname('AScore_1').Value;
   qry1.post;
   end
   else
   begin
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:=0;
   qry1.post;
   end
 end
 else
 begin
 qry1.Edit;
 qry1.fieldbyname('RScore').Value:=0;
 qry1.post;
 end;
   
end;

procedure TfrmExam.chkCClick(Sender: TObject);
begin
 if chkC.Checked=True then
 begin
 if chkB.Checked=true  then chkB.Checked:=False;
 if chkA.Checked=true  then chkA.Checked:=False;
 if chkD.Checked=true  then chkD.Checked:=False;

   qry1.Edit;
   qry1.FieldByName('sel').Value:='C';
   qry1.post;

   if  qry1.fieldbyname('PRight').Value='C' then
   begin
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:= qry1.fieldbyname('AScore_1').Value;
   qry1.post;
   end
   else
   begin
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:=0;
   qry1.post;
   end;
 end
 else
 begin
 qry1.Edit;
 qry1.fieldbyname('RScore').Value:=0;
 qry1.post;
 end;

end;

procedure TfrmExam.chkDClick(Sender: TObject);
begin
 if chkD.Checked=True then
 begin
 if chkB.Checked=true  then chkB.Checked:=False;
 if chkA.Checked=true  then chkA.Checked:=False;
 if chkC.Checked=true  then chkC.Checked:=False;

   qry1.Edit;
   qry1.FieldByName('sel').Value:='D';
   qry1.post;

    if  qry1.fieldbyname('PRight').Value='D' then
    begin
    qry1.Edit;
    qry1.fieldbyname('RScore').Value:= qry1.fieldbyname('AScore_1').Value;
    qry1.post;
    end
    else
    begin
     qry1.Edit;
     qry1.fieldbyname('RScore').Value:=0;
     qry1.post;
    end;
 end
 else
 begin
 qry1.Edit;
 qry1.fieldbyname('RScore').Value:=0;
 qry1.post;
 end;

end;

procedure TfrmExam.btn_CommitClick(Sender: TObject);
begin
 if MessageDlg('确定要提交吗？',mtConfirmation,[mbYes,mbno],0)=mrYes  then 
 begin
  FAScore:=0;
 
  qry1.First;
  while not qry1.Eof do
  begin
   FAScore:=FAScore+qry1.fieldbyname('RScore').AsFloat;
   qry1.Next;
  end;

  ModalResult:=mrok;
 end;
end;

procedure TfrmExam.dbtxtA1Click(Sender: TObject);
begin
 if chkA.Checked=false then
 begin
    chkA.Checked:=True;
    chkB.Checked:=false;
    chkC.Checked:=false;
    chkD.Checked:=false;

   qry1.Edit;
   qry1.FieldByName('sel').Value:='A';
   qry1.post;

   if chkB.Checked=true  then chkB.Checked:=False;
   if chkC.Checked=true  then chkC.Checked:=False;
   if chkD.Checked=true  then chkD.Checked:=False;

   if  qry1.fieldbyname('PRight').Value='A' then
   begin
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:= qry1.fieldbyname('AScore_1').Value;
   qry1.post;
   end
   else
   begin
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:= 0;
   qry1.post;
   end;
 end
 else
 begin
   chkA.Checked:=false;
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:= 0;
   qry1.post;
 end;

end;

procedure TfrmExam.dbtxtBClick(Sender: TObject);
begin
 if chkB.Checked=false then
 begin
    chkA.Checked:=false;
    chkB.Checked:=True;
    chkC.Checked:=false;
    chkD.Checked:=false;

   qry1.Edit;
   qry1.FieldByName('sel').Value:='B';
   qry1.post;

   if  qry1.fieldbyname('PRight').Value='B' then
   begin
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:= qry1.fieldbyname('AScore_1').Value;
   qry1.post;
   end
   else
   begin
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:= 0;
   qry1.post;
   end;
 end
  else
 begin
   chkB.Checked:=false;
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:= 0;
   qry1.post;
 end;

end;

procedure TfrmExam.dbtxtCClick(Sender: TObject);
begin
 if chkC.Checked=false then
 begin
    chkA.Checked:=false;
    chkC.Checked:=True;
    chkB.Checked:=false;
    chkD.Checked:=false;

   qry1.Edit;
   qry1.FieldByName('sel').Value:='C';
   qry1.post;

   if  qry1.fieldbyname('PRight').Value='C' then
   begin
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:= qry1.fieldbyname('AScore_1').Value;
   qry1.post;
   end
   else
   begin
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:= 0;
   qry1.post;
   end;
 end
  else
 begin
   chkC.Checked:=false;
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:= 0;
   qry1.post;
 end;

end;

procedure TfrmExam.dbtxtDClick(Sender: TObject);
begin
 if chkD.Checked=false then
 begin
    chkA.Checked:=false;
    chkC.Checked:=false;
    chkB.Checked:=false;
    chkD.Checked:=true;

   qry1.Edit;
   qry1.FieldByName('sel').Value:='D';
   qry1.post;

   if  qry1.fieldbyname('PRight').Value='D' then
   begin
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:= qry1.fieldbyname('AScore_1').Value;
   qry1.post;
   end
   else
   begin
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:= 0;
   qry1.post;
   end;
 end
 else
 begin
   chkD.Checked:=false;
   qry1.Edit;
   qry1.fieldbyname('RScore').Value:= 0;
   qry1.post;
 end;

end;

end.
