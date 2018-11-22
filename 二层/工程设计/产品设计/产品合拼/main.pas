unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, DBGridEh, ExtCtrls, StdCtrls, DB, ADODB,
  ComCtrls, RzGrids, Menus;

type
  TPO=record
        RKEY25: Integer;
        RKEY60: Integer;
        PO: string[12];
      end;
  TfrmMain = class(TForm)
    pnl1: TPanel;
    btnCondition: TBitBtn;
    btnRefresh: TBitBtn;
    pb1: TProgressBar;
    RzStringGrid1: TRzStringGrid;
    spl1: TSplitter;
    pnl3: TPanel;
    pnl2: TPanel;
    btnOK: TSpeedButton;
    RzStringGrid2: TRzStringGrid;
    pm1: TPopupMenu;
    N1: TMenuItem;
    btnExit: TBitBtn;
    procedure btnConditionClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzStringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure RzStringGrid1DblClick(Sender: TObject);
    procedure RzStringGrid2DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ClearSGrid(SGrid: TRzStringGrid; aRow, aCol: integer);
    procedure RefreshSGridData(SGrid: TRzStringGrid);
  end;

var
  frmMain: TfrmMain;
  USERRKEY: string;
  
implementation

uses common, damo, SpellCondition, uQnty;

{$R *.dfm}

procedure TfrmMain.btnConditionClick(Sender: TObject);
var
  frmSpellCondition: TfrmSpellCondition;
begin
  if StrToInt(vprev) <> 4 then
  begin
    ShowMessage('无权限');
    Abort;
  end;
  frmSpellCondition:= TfrmSpellCondition.Create(Self);
  try
    with frmSpellCondition do
    begin
      dm.tblSpellCondition.Close;
      dm.tblSpellCondition.Open;
      dm.tblSpellDifferentCondition.Close;
      dm.tblSpellDifferentCondition.Open;
      ShowModal;
    end;
  finally
    frmSpellCondition.Free;
  end;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var i: integer;
begin
  dm.qryPOFrom.Close;
  dm.qryPOFrom.Open;

  ClearSGrid(RzStringGrid1,dm.qryPOFrom.RecordCount+1,dm.qryPOFrom.FieldCount);
  ClearSGrid(RzStringGrid2,2,dm.qryPOFrom.FieldCount);

  for i:=0 to dm.qryPOFrom.FieldCount-1 do
  begin
    RzStringGrid1.Cells[i,0]:= dm.qryPOFrom.Fields[i].FieldName;
    RzStringGrid1.ColWidths[i]:= dm.qryPOFrom.Fields[i].DisplayWidth;
    RzStringGrid2.Cells[i,0]:= dm.qryPOFrom.Fields[i].FieldName;
    RzStringGrid2.ColWidths[i]:= dm.qryPOFrom.Fields[i].DisplayWidth;
  end;
  RzStringGrid1.ColWidths[0]:=0;
  RzStringGrid1.ColWidths[1]:=0;
  RzStringGrid2.ColWidths[0]:=0;
  RzStringGrid2.ColWidths[1]:=0;
  RefreshSGridData(RzStringGrid1);     
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
{$IFDEF Release}
  if not App_init_2(dm.con1) then
  begin
    showmsg('程序起动失败，请联系管理员！',1);
    application.Terminate;
  end;
{$ENDIF}
{$IFDEF Debug}
  dm.con1.Connected:= False;
  dm.con1.Connected:= True;
  vprev:= '4';  //4写银
  rkey73:='2444';
{$ENDIF}
  self.caption:= application.Title;
  DateSeparator:= '-';
  ShortDateFormat:= 'yyyy-mm-dd';
  LongDateFormat:='YYYY-MM-DD HH:NN:SS';
end;

procedure TfrmMain.btnOKClick(Sender: TObject);
var
  i:Integer;
  POList: array of TPO;
begin
  if not (StrToInt(vprev) in [2,4]) then
  begin
    ShowMessage('无权限');
    Abort;
  end;
  if RzStringGrid2.RowCount<=2 then Exit;
  if RzStringGrid2.RowCount=3 then
  begin
    ShowMessage('一个订单无法合拼!');
    Exit;
  end;
{  SetLength(POList,RzStringGrid2.RowCount-2);
  for i:=1 to RzStringGrid2.RowCount-2 do
  begin
    POList[i-1].RKEY25:= StrToInt(RzStringGrid2.Cells[0,i]);
    POList[i-1].RKEY60:= StrToInt(RzStringGrid2.Cells[1,i]);
    POList[i-1].PO:= RzStringGrid2.Cells[2,i];
  end;
  frmQnty:= TfrmQnty.Create(nil);
  frmQnty.InitPaint(Length(POList),POList);
  if frmQnty.ShowModal=mrok then
  begin
    ShowMessage('合拼成功!');
    btnRefreshClick(nil);
  end;}
  frmQnty:= TfrmQnty.Create(nil);
  try
    with frmQnty do
    begin
      for i:=1 to RzStringGrid2.RowCount-2 do
      begin
        cdsOrder.Append;
        cdsOrder.FieldByName('RKEY25').Value:=StrToInt(RzStringGrid2.Cells[0,i]);
        cdsOrder.FieldByName('RKEY60').Value:=StrToInt(RzStringGrid2.Cells[1,i]);
        cdsOrder.FieldByName('PONO').Value:=RzStringGrid2.Cells[2,i];
        cdsOrder.FieldByName('MANU_PART_NUMBER').Value:=RzStringGrid2.Cells[3,i];
      end;
    end;
  finally
    frmQnty.ShowModal;
    btnRefreshClick(nil);
  end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var i: integer;
begin
  if not dm.con1.Connected then Exit;
  with dm.qryTmp do
  begin
   Close;
   SQL.Clear;
   SQL.Add('Select EMPLOYEE_PTR from data0073');
   SQL.Add('Where rkey='+rkey73);
   Open;
   USERRKEY := FieldByName('EMPLOYEE_PTR').AsString;
  end;
  dm.qryPOFrom.Close;
  dm.qryPOFrom.Open;
  RzStringGrid1.ColCount:= dm.qryPOFrom.FieldCount;  //设定表格的行数和列数,列标题以及列宽
  RzStringGrid1.RowCount:= dm.qryPOFrom.RecordCount+1;
  RzStringGrid2.ColCount:= dm.qryPOFrom.FieldCount;
  RzStringGrid2.RowCount:= 2;
  for i:=0 to dm.qryPOFrom.FieldCount-1 do
  begin
    RzStringGrid1.Cells[i,0]:= dm.qryPOFrom.Fields[i].FieldName;
    RzStringGrid1.ColWidths[i]:= dm.qryPOFrom.Fields[i].DisplayWidth;
    RzStringGrid2.Cells[i,0]:= dm.qryPOFrom.Fields[i].FieldName;
    RzStringGrid2.ColWidths[i]:= dm.qryPOFrom.Fields[i].DisplayWidth;
  end;
  RzStringGrid1.ColWidths[0]:=0;
  RzStringGrid1.ColWidths[1]:=0;
  RzStringGrid2.ColWidths[0]:=0;
  RzStringGrid2.ColWidths[1]:=0;

  RefreshSGridData(RzStringGrid1);
end;

procedure TfrmMain.RzStringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s: string;
  r: TRect;
begin
  if ARow = 0 then  //第一行标题栏居中
  begin
    with TRzStringGrid(Sender) do
    begin
      Canvas.Brush.Color := $00F0DDCE;
      Canvas.FillRect(Rect);
      s:= Cells[ACol, ARow];
      r:= Rect;
      DrawText(Canvas.Handle, PChar(s), Length(s), r, DT_CENTER or DT_SINGLELINE or DT_VCENTER);
    end;
  end;
end;

procedure TfrmMain.ClearSGrid(SGrid: TRzStringGrid; aRow, aCol: integer);
var i: integer;
begin
  for i := 1 to SGrid.RowCount - 1 do  //清空表格,不清表头
    SGrid.Rows[i].Clear;
  SGrid.RowCount := aRow;
  SGrid.ColCount := aCol;
end;

procedure TfrmMain.RefreshSGridData(SGrid: TRzStringGrid);
var i: integer;
begin
  dm.qryPOFrom.First;  //表格内容赋值
  while not (dm.qryPOFrom.Eof) do
  begin
    for i:=0 to dm.qryPOFrom.FieldCount-1 do
    begin
      SGrid.Cells[i,dm.qryPOFrom.RecNo]:= dm.qryPOFrom.Fields[i].AsString;
    end;
    dm.qryPOFrom.Next;
  end;
end;

procedure TfrmMain.RzStringGrid1DblClick(Sender: TObject);
var i,j,m,n: Integer;
    List: TStringList;
    isLevelMore: Char;
    isSame: Boolean;
    MANU_PART_NUMBER: string;
label toNext;
begin
  if RzStringGrid1.Row = 0 then Exit;
  if RzStringGrid2.RowCount>2 then
  begin
    if Application.MessageBox('已选择待合拼订单，确定要清空已选内容吗？', '提示', MB_OKCANCEL + MB_ICONWARNING) = IDOK then
      btnRefreshClick(nil);
    Abort;
  end;

  List:=TStringList.Create;
  try
    for i:=0 to RzStringGrid1.ColCount-1 do
      List.Add(RzStringGrid1.Cells[i, 0]+'='+RzStringGrid1.Cells[i, RzStringGrid1.Row]);  //存储所选定行的各项参数
//    ShowMessage(List[i]+'|'+List.Names[i]+'|'+List.ValueFromIndex[i]+'|'+List.Values['层数']);
    MANU_PART_NUMBER:= RzStringGrid1.Cells[3,RzStringGrid1.Row];  //记录所选行的本厂编号
    RzStringGrid2.RowCount:= RzStringGrid2.RowCount + 1;
    for i:=0 to RzStringGrid2.ColCount-1 do
      RzStringGrid2.Cells[i, RzStringGrid2.RowCount-2]:=RzStringGrid1.Cells[i, RzStringGrid1.Row];
    for j:= RzStringGrid1.Row to RzStringGrid1.RowCount - 1 do
      RzStringGrid1.Rows[j]:= RzStringGrid1.Rows[j + 1];
    RzStringGrid1.RowCount:= RzStringGrid1.RowCount - 1; //删除

    if List.Values['层数']='2' then
      isLevelMore:='0'
    else
      isLevelMore:='1';
    with dm.qryTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select t278.PARAMETER_DESC from SpellCondition t0 inner join data0278 t278 on t0.Param_PTR=t278.RKEY ');
      SQL.Add('where t0.IsDifferent=0 and t0.LevelMore='+isLevelMore);
      Open;
    end;
    if RzStringGrid1.RowCount>1 then
    begin
      RzStringGrid1.Row:=1;  //First
      j:= RzStringGrid1.RowCount-1;
      pb1.Visible:= True;
      pb1.Max:= j;
      pb1.Position:=0;
      for i:= 1 to j do
      begin
        isSame:= True;
        if MANU_PART_NUMBER=RzStringGrid1.Cells[3,RzStringGrid1.Row] then  //相同本厂编号不允许合拼
        begin
          isSame:= False;
          Goto toNext;
        end;
        dm.qryTmp.First;
        while not dm.qryTmp.Eof do
        begin
          if List.Values[dm.qryTmp.FieldByName('PARAMETER_DESC').AsString] <>
             RzStringGrid1.Cells[List.IndexOfName(dm.qryTmp.FieldByName('PARAMETER_DESC').AsString), RzStringGrid1.Row] then
          begin
            isSame:= False;
            Break;
          end;
          dm.qryTmp.Next;
        end;
        toNext:
        if isSame then
        begin
          RzStringGrid2.RowCount:= RzStringGrid2.RowCount + 1;
          for m:=0 to RzStringGrid2.ColCount-1 do
            RzStringGrid2.Cells[m, RzStringGrid2.RowCount-2]:=RzStringGrid1.Cells[m, RzStringGrid1.Row];
          for n:= RzStringGrid1.Row to RzStringGrid1.RowCount - 1 do
            RzStringGrid1.Rows[n]:= RzStringGrid1.Rows[n + 1];
          RzStringGrid1.RowCount:= RzStringGrid1.RowCount - 1;
        end
        else
        begin
          if RzStringGrid1.Row<RzStringGrid1.RowCount-1 then
          RzStringGrid1.Row:=RzStringGrid1.Row+1;
        end;
        pb1.Position:=pb1.Position+1;
      end;
      pb1.Visible:= False;
    end;
  finally
    List.Free;
  end;  
end;

procedure TfrmMain.RzStringGrid2DblClick(Sender: TObject);
var i,j: Integer;
begin
  if RzStringGrid2.Row = 0 then Exit;
  if RzStringGrid2.Row = RzStringGrid2.RowCount-1 then Exit;
  RzStringGrid1.RowCount:= RzStringGrid1.RowCount + 1;
  for i:=0 to RzStringGrid1.ColCount-1 do
    RzStringGrid1.Cells[i, RzStringGrid1.RowCount-1]:=RzStringGrid2.Cells[i, RzStringGrid2.Row];
  for j:= RzStringGrid2.Row to RzStringGrid2.RowCount - 2 do
    RzStringGrid2.Rows[j]:= RzStringGrid2.Rows[j + 1];
  RzStringGrid2.RowCount:= RzStringGrid2.RowCount - 1; //删除
end;

procedure TfrmMain.N1Click(Sender: TObject);
var i: Integer;
begin
  try
    with dm.qryTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Update Data0060 Set SpellTogether=-1 Where RKEY='+RzStringGrid1.Cells[1,RzStringGrid1.Row]);
      ExecSQL;
    end;
    for i:= RzStringGrid1.Row to RzStringGrid1.RowCount - 1 do
      RzStringGrid1.Rows[i]:= RzStringGrid1.Rows[i + 1];
    RzStringGrid1.RowCount:= RzStringGrid1.RowCount - 1; //删除
    ShowMessage('操作成功！');
  except
    ShowMessage('操作失败！');
  end;
end;

procedure TfrmMain.pm1Popup(Sender: TObject);
begin
  if RzStringGrid1.RowCount<2 then
    N1.Visible:=False
  else
    N1.Visible:=True;
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

end.
