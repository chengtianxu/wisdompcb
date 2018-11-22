unit Deptcheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, StdCtrls, ExtCtrls, ComCtrls;

type
  TFrm_DeptCheck = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btnOK: TButton;
    pnl3: TPanel;
    pnl4: TPanel;
    btnAddAll: TButton;
    btnDeleOne: TButton;
    btnAddOne: TButton;
    btnDeleAll: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    lvRStep: TListView;
    lvMIStep: TListView;
    procedure FormShow(Sender: TObject);
    procedure btnDeleOneClick(Sender: TObject);
    procedure btnAddAllClick(Sender: TObject);
    procedure btnDeleAllClick(Sender: TObject);
    procedure btnAddOneClick(Sender: TObject);
    procedure eh1DblClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetMIPassStepData(rkey25,step_number: string);
    function AddRStep: Boolean;
  public
    { Public declarations }
    step_number,rkey25:string;
    y:string;
  end;

var
  Frm_DeptCheck: TFrm_DeptCheck;

implementation

uses
  demo;

{$R *.dfm}

{ TfrmFG1 }

procedure TFrm_DeptCheck.GetMIPassStepData(rkey25,step_number: string);
var
  LS: TStringList;
  tmpS: string;
  LItem: TListItem;
begin
  LS := TStringList.Create;
  try
    tmpS := 'SELECT D38.STEP_NUMBER, D34.DEPT_CODE,D34.DEPT_NAME,BARCODE_ENTRY_FLAG,D34.RKey AS RKey34 FROM Data0038 D38 '+
            ' INNER JOIN Data0034 D34 ON D38.DEPT_PTR = D34.RKey ' +
            ' WHERE D38.STEP_NUMBER <= '+ step_number+' AND D38.SOURCE_PTR = ' + rkey25 +
            ' ORDER BY D38.STEP_NUMBER';
    LS.Add(tmpS);
    if not DM.SqlOpen(LS,dm.qryMIStep) then
      ShowMessage('取得返工流程失败')
    else
    begin
      DM.qryMIStep.First;
      while not DM.qryMIStep.Eof do
      begin
        LItem := lvMIStep.Items.Add;
        LItem.Caption := DM.qryMIStep.FieldByName('STEP_NUMBER').AsString;
        LItem.SubItems.Add(DM.qryMIStep.fieldByName('Dept_Code').AsString);
        LItem.SubItems.Add(DM.qryMIStep.fieldByName('Dept_Name').AsString);
        if DM.qryMIStep.fieldByName('BARCODE_ENTRY_FLAG').AsString = 'Y' then
          LItem.SubItems.Add('是')
        else
          LItem.SubItems.Add('否');
        LItem.SubItems.Add(DM.qryMIStep.fieldByName('BARCODE_ENTRY_FLAG').AsString);
        LItem.Data := Pointer(DM.qryMIStep.fieldByName('RKey34').AsInteger);
        DM.qryMIStep.Next;
      end;
      lvMIStep.Items[0].Selected := True;
      lvMIStep.Items.Delete(lvMIStep.Items.Count - 1);//删除当前的工序,禁止选择当前的工序
    end;
  finally
    LS.Free;
  end;
end;

procedure TFrm_DeptCheck.FormShow(Sender: TObject);
begin
  lvMIStep.Clear;
  GetMIPassStepData(rkey25,step_number);
  lvRStep.Clear;
end;

function TFrm_DeptCheck.AddRStep: Boolean;
var
  LItem: TListItem;
  I: Integer;

begin
  Result := False;
  if lvMIStep.Selected <> nil then
  begin
    if lvRStep.Items.Count = 0 then
    begin
//      ShowMessage(y);
//      ShowMessage(lvMIStep.Selected.SubItems[0]);
      if lvMIStep.Selected.SubItems[2] <> '是' then
      begin
       DM.ADOQuery3.Close;
       DM.ADOQuery3.Parameters[0].Value:=y;
       DM.ADOQuery3.Open;
       DM.ADOQuery4.Close;
       DM.ADOQuery4.Parameters[0].Value:=lvMIStep.Selected.SubItems[0];
       DM.ADOQuery4.Open;
       if dm.ADOQuery3BIG_DEPT_PTR.Value<> dm.ADOQuery4BIG_DEPT_PTR.Value then
       begin
        ShowMessage('非过数工序只能选择相同班组');
        Exit;
       end;

//        ShowMessage('返工第一步接受工序必须是过数工序!');
//        Exit;
      end;
    end;
    for I := 0 to lvRStep.Items.Count - 1 do
    begin
      if StrToInt(lvRStep.Items[I].SubItems[2]) > StrToInt(lvMIStep.Selected.Caption) then
      begin
        ShowMessage('返工工序必须按顺序来建立,请添加MI中 ' + lvRStep.Items[lvRStep.Items.count-1].SubItems[2] + ' 步后面工序');
        Exit;
      end;
    end;

    LItem := lvRStep.Items.Add;
    LItem.Caption := IntToStr(lvRStep.Items.Count);
    LItem.SubItems.Add(lvMIStep.Selected.SubItems[0]);
    LItem.SubItems.Add(lvMIStep.Selected.SubItems[1]);
    LItem.SubItems.Add(lvMIStep.Selected.Caption);
    LItem.SubItems.Add(lvMIStep.Selected.SubItems[2]);
    LItem.Data := lvMIStep.Selected.Data;
    lvMIStep.DeleteSelected;
    Result := True;
  end;
end;

procedure TFrm_DeptCheck.btnDeleOneClick(Sender: TObject);
var
  I: Integer;
  LItem: TListItem;
begin
  if lvRStep.Selected <> nil then
  begin
    if (lvRStep.Selected.Caption='1') and (lvRStep.Items.Count>1)then
    begin
      if (lvRStep.Items[1].SubItems.strings[3])='否' then
      begin
       ShowMessage('删除会导致非过数工序在第一步');
       Exit;
      end;
    end;
    for I := 0 to lvMIStep.Items.Count - 1 do
    begin
      if StrToInt(lvMIStep.Items[I].Caption) > StrToInt(lvRStep.Selected.SubItems[2]) then
        Break;
    end;
    LItem := lvMIStep.Items.Insert(I);
    LItem.Caption := lvRStep.Selected.SubItems[2];
    LItem.SubItems.Add(lvRStep.Selected.SubItems[0]);
    LItem.SubItems.Add(lvRStep.Selected.SubItems[1]);
    LItem.SubItems.Add(lvRStep.Selected.SubItems[3]);
    LItem.Data := lvRStep.Selected.Data;
  end;
  lvRStep.DeleteSelected;
  for I := 0 to lvRStep.Items.Count - 1 do
  begin
    lvRStep.Items[I].Caption := IntToStr(I+1);
  end;
end;

procedure TFrm_DeptCheck.btnAddAllClick(Sender: TObject);
begin
  while lvMIStep.Items.Count <> 0 do
  begin
    lvMIStep.Items[0].Selected := True;
    if not AddRStep then Break;
  end;
end;

procedure TFrm_DeptCheck.btnDeleAllClick(Sender: TObject);
begin
  FormShow(Self);
end;

procedure TFrm_DeptCheck.btnAddOneClick(Sender: TObject);
begin
  AddRStep;
end;

procedure TFrm_DeptCheck.eh1DblClick(Sender: TObject);
begin
  AddRStep;
end;

procedure TFrm_DeptCheck.btnOKClick(Sender: TObject);
begin


 if lvRStep.Items.Count=0 then
  ModalResult:= mrno
  else
  ModalResult:=mrok;
end;

end.
