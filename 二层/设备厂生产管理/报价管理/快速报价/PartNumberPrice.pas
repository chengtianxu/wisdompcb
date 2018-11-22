unit PartNumberPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, Buttons, StdCtrls, ADODB, Menus;

type
  TFrmNumberPrice = class(TForm)
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure DeleteRow(Row: Integer);
  public
    { Public declarations }
       
  end;

var
  FrmNumberPrice: TFrmNumberPrice;

implementation

uses common, Damo, Pick_Item_Single, ConstVar;

{$R *.dfm}

procedure TFrmNumberPrice.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0,0] := '序号';
  StringGrid1.Cells[1,0] := '材料编码';
  StringGrid1.Cells[2,0] := '材料名称';
  StringGrid1.Cells[3,0] := '材料规格';
  StringGrid1.Cells[4,0] := '配额用量';
  StringGrid1.Cells[5,0] := '价格';
  StringGrid1.Cells[6,0] := '备注';
  StringGrid1.ColWidths[7] := 0;
  StringGrid1.Cells[0, StringGrid1.Row] := IntToStr(DM.tag);
  StringGrid1.Col := 1;
  StringGrid1.Row := 1;
end;

procedure TFrmNumberPrice.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
begin
  if (ACol = 8) then
  begin
    if (ARow = Self.StringGrid1.RowCount-1) then
    begin
      StringGrid1.Cells[8,0]:='新增';
      SpeedButton1.Visible := False;
      SpeedButton1.Visible := CanSelect;
      if not CanSelect then Exit;
      SpeedButton1.Parent := StringGrid1;
      R := StringGrid1.CellRect(ACol, ARow);
      SpeedButton1.BoundsRect := R;
      SpeedButton1.Width := SpeedButton1.Height;
      SpeedButton1.Left  := R.Right - SpeedButton1.Width;
    end;
  end
  else
  begin
    SpeedButton1.Visible := False;
  end;
  
  if ACol=1 then
  begin
      SpeedButton2.Visible := CanSelect;
      if not CanSelect then Exit;
      SpeedButton2.Parent := StringGrid1;
      R := StringGrid1.CellRect(ACol, ARow);
      SpeedButton2.BoundsRect := R;
      SpeedButton2.Width := SpeedButton2.Height;
      SpeedButton2.Left  := R.Right - SpeedButton2.Width;
  end;
  
  if ACol=0 then StringGrid1.Cells[0, StringGrid1.Row] := IntToStr(DM.tag);

  if (ACol = 0) or (ACol = 1) or (ACol = 3) or (ACol = 5) then
    StringGrid1.Options   :=   StringGrid1.Options   -   [goEditing]
  else
    StringGrid1.Options   :=   StringGrid1.Options   +   [goEditing];
end;

procedure TFrmNumberPrice.SpeedButton1Click(Sender: TObject);
begin
  StringGrid1.RowCount := StringGrid1.RowCount + 1;
  Self.SpeedButton1.Visible:=False;
  StringGrid1.Cells[0, StringGrid1.Row + 1] := IntToStr(DM.tag);
end;

procedure TFrmNumberPrice.SpeedButton2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
  i: Integer;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'inv_part_number/材料编码/100,inv_part_description/材料描述/120,INV_NAME/材料名称/120,INV_DESCRIPTION/材料规格/120,QUAN_ON_HAND/当前库存/60,STD_COST/标准成本/60,';
    InputVar.Sqlstr :='select rkey,inv_part_number,INV_NAME,INV_DESCRIPTION,inv_part_description,STD_COST,QUAN_ON_HAND from data0017 ';   //where data0492.tstatus <> 4
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      StringGrid1.Cells[1, StringGrid1.Row] := frmPick_Item_Single.adsPick.FieldValues['inv_part_number'];
      StringGrid1.Cells[2, StringGrid1.Row] := frmPick_Item_Single.adsPick.FieldValues['INV_NAME'];
      StringGrid1.Cells[3, StringGrid1.Row] := frmPick_Item_Single.adsPick.FieldValues['INV_DESCRIPTION'];
      StringGrid1.Cells[5, StringGrid1.Row] := frmPick_Item_Single.adsPick.FieldValues['STD_COST'];
      StringGrid1.Cells[7, StringGrid1.Row] := frmPick_Item_Single.adsPick.FieldValues['rkey'];
      for i := 1 to StringGrid1.RowCount - 1 do
      begin
        if StringGrid1.Cells[1,StringGrid1.Row] = StringGrid1.Cells[1, i-1] then
        begin
          ShowMessage('同一报价单号，同一材料类型不允许添加同一材料！');
          StringGrid1.Cells[1,StringGrid1.Row] := '';
          StringGrid1.Cells[2,StringGrid1.Row] := '';
          StringGrid1.Cells[3,StringGrid1.Row] := '';
          StringGrid1.Cells[4,StringGrid1.Row] := '';
          StringGrid1.Cells[5,StringGrid1.Row] := '';
          StringGrid1.Cells[6,StringGrid1.Row] := '';
          Exit;
        end;
      end;
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmNumberPrice.BitBtn2Click(Sender: TObject);
var
  i, j: Integer;
begin
  if Trim(FrmNumberPrice.StringGrid1.Cells[5,1]) = '' then Exit;
  DM.inventTotalPrice := 0; //对应某个材料类别合计总价

  for i := 0 to StringGrid1.RowCount - 2 do
  begin
    DM.inventTotalPrice := DM.inventTotalPrice + ( strtofloat(StringGrid1.Cells[4, i+1]) * strtofloat(StringGrid1.Cells[5,i+1]) );
  end;
  if not dm.qry87_1.Active then dm.qry87_1.Open;
  if not dm.qry87_1.IsEmpty then
  begin
    DM.qry87_1.First;
    for j := 0 to DM.qry87_1.RecordCount - 1 do
    begin
      DM.qry87_1.Delete;
      DM.qry87_1.Next;
    end;
  end;
  for i := 0 to StringGrid1.RowCount - 2 do
  begin
    DM.qry87_1.Append;
    DM.qry87_1quote_ptr.Value := 0;
    DM.qry87_1step_no.Value := StrToInt(StringGrid1.Cells[0, i+1]);
    DM.qry87_1inv_part_number.Value := StringGrid1.Cells[1, i+1];
    DM.qry87_1INV_NAME.Value:=StringGrid1.Cells[2, i+1];
    DM.qry87_1INV_DESCRIPTION.Value:=StringGrid1.Cells[3, i+1];
    DM.qry87_1QUAN_BOM.Value := StrToFloat(StringGrid1.Cells[4, i+1]);
    DM.qry87_1STD_COST.Value := StrToFloat(StringGrid1.Cells[5, i+1]);
    if Trim(StringGrid1.Cells[6, i+1]) <> '' then DM.qry87_1VENDOR.Value := StringGrid1.Cells[6, i+1];
    DM.qry87_1INVENT_PTR.Value := StrToInt(StringGrid1.Cells[7, i+1]);
    DM.qry87_1.Post;
  end;
  ModalResult := mrOk;
end;

procedure TFrmNumberPrice.FormShow(Sender: TObject);
var
  i: Integer;
begin
  if (DM.flag = 0) then  //新增报价单
  begin
    dm.qry87_1.Filter := '';
    with dm.qry87_1 do
    begin
      if not Active then
      Open;
    end;
    if DM.qry87_1.RecordCount > 0 then
    begin
      dm.qry87_1.Filter := ' step_no = ' + IntToStr(DM.tag);
      dm.qry87_1.First;
      for i := 0 to DM.qry87_1.RecordCount - 1 do
      begin
        StringGrid1.Cells[0, i+1] := IntToStr(DM.qry87_1.FieldValues['step_no']);
        StringGrid1.Cells[1, i+1] := DM.qry87_1.FieldValues['inv_part_number'];
        StringGrid1.Cells[2, i+1] := DM.qry87_1.FieldValues['INV_NAME'];
        StringGrid1.Cells[3, i+1] := DM.qry87_1.FieldValues['INV_DESCRIPTION'];
        StringGrid1.Cells[4, i+1] := FloatToStr(DM.qry87_1.FieldValues['quan_bom']);
        StringGrid1.Cells[5, i+1] := FloatToStr(DM.qry87_1.FieldValues['std_cost']);
        if not dm.qry87_1.FieldByName('vendor').IsNull then
          StringGrid1.Cells[6, i+1] := DM.qry87_1.FieldValues['vendor'];
        StringGrid1.Cells[7, i+1] := IntToStr(DM.qry87_1.FieldValues['invent_ptr']);
        StringGrid1.RowCount := DM.qry87_1.RecordCount + 1 ;
        dm.qry87_1.next;
      end;
    end;
  end;
  if (dm.flag = 1) or (DM.flag = 2) then //编辑和查看报价单状态下
  begin
    if dm.qry87_1.Active = False then   //如果是第一次打开， 并且有数据，将数据存入缓存中，否则该段代码不执行，直接打开缓存数据
    begin
      dm.qry87_1.Open;
      with DM.qrytemp do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select wzcp0087.*, data0017.rkey rkey17,data0017.inv_part_number,data0017.INV_NAME,data0017.INV_DESCRIPTION from wzcp0087 inner join data0017 on '
          + 'wzcp0087.invent_ptr=data0017.rkey where quote_ptr = ' + IntToStr(DM.qryCp85rkey.Value);
        Open;
        if RecordCount > 0 then
        begin
          First;
          for i := 0 to RecordCount - 1 do
          begin
            DM.qry87_1.Append;
            DM.qry87_1quote_ptr.Value := FieldValues['quote_ptr'];
            DM.qry87_1step_no.Value := FieldValues['step_no'];
            DM.qry87_1inv_part_number.Value := FieldValues['inv_part_number'];
            DM.qry87_1INV_NAME.Value:=FieldValues['INV_NAME'];
            DM.qry87_1INV_DESCRIPTION.Value:=FieldValues['INV_DESCRIPTION'];
            DM.qry87_1QUAN_BOM.Value := FieldValues['QUAN_BOM'];
            DM.qry87_1STD_COST.Value := FieldValues['STD_COST'];
            if not FieldByName('VENDOR').IsNull then
              DM.qry87_1VENDOR.Value := FieldValues['VENDOR'];
            DM.qry87_1INVENT_PTR.Value := FieldValues['INVENT_PTR'];
            DM.qry87_1.Post;
            Next;
          end;
        end;
      end;
    end;

    dm.qry87_1.Filter := '';
    if dm.qry87_1.Active = False then dm.qry87_1.Open;
    if DM.qry87_1.RecordCount > 0 then
    begin
      dm.qry87_1.Filter := ' step_no = ' + IntToStr(DM.tag);
      dm.qry87_1.First;
      for i := 0 to DM.qry87_1.RecordCount - 1 do
      begin
        StringGrid1.Cells[0, i+1] := IntToStr(DM.qry87_1.FieldValues['step_no']);
        StringGrid1.Cells[1, i+1] := DM.qry87_1.FieldValues['inv_part_number'];
        StringGrid1.Cells[2, i+1] := DM.qry87_1.FieldValues['INV_NAME'];
        StringGrid1.Cells[3, i+1] := DM.qry87_1.FieldValues['INV_DESCRIPTION'];
        StringGrid1.Cells[4, i+1] := FloatToStr(DM.qry87_1.FieldValues['quan_bom']);
        StringGrid1.Cells[5, i+1] := FloatToStr(DM.qry87_1.FieldValues['std_cost']);
        if not dm.qry87_1.FieldByName('vendor').IsNull then
          StringGrid1.Cells[6, i+1] := DM.qry87_1.FieldValues['vendor'];
        StringGrid1.Cells[7, i+1] := IntToStr(DM.qry87_1.FieldValues['invent_ptr']);
        StringGrid1.RowCount:= DM.qry87_1.RecordCount + 1 ;
        dm.qry87_1.next;
      end;
    end;
  end;
end;

procedure TFrmNumberPrice.BitBtn1Click(Sender: TObject);
begin
  //DM.inventTotalPrice := 0.00;
end;

//删除
procedure  TFrmNumberPrice.DeleteRow(Row: Integer);
var 
  i: integer;
begin
  if (Row < StringGrid1.RowCount) and (Row > StringGrid1.FixedRows-1) then
  begin
    if Row < StringGrid1.RowCount - 1 then
    begin
      for i := Row to StringGrid1.RowCount - 1 do
      begin
        StringGrid1.Rows[i] := StringGrid1.Rows[i + 1];
      end;
    end
    else StringGrid1.Rows[Row].Clear;
    StringGrid1.RowCount := StringGrid1.RowCount - 1;
  end;
end;

procedure TFrmNumberPrice.N1Click(Sender: TObject);
var
  Sel: TGridRect;
  i: Integer;
begin
  Sel := StringGrid1.Selection;
  DeleteRow(Sel.Top);

  //如果删除后只剩下一行，则初始化StringGrid1的显示方式
  if StringGrid1.RowCount = 1 then
  begin
    StringGrid1.RowCount := 2;
    StringGrid1.FixedRows := 1;
  end;  
end;

procedure TFrmNumberPrice.StringGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StringGrid1.Col in [2, 3] then
  begin
    if not (Key in ['0'..'9', #8, #46]) then Key := #0;
  end;
end;

procedure TFrmNumberPrice.BitBtn3Click(Sender: TObject);
begin
  common.Export_Grid_to_Excel(StringGrid1, '材料价格明细');
end;

end.
