{*******************************************************}
{                                                       }
{       Fram调用条件设置窗体                            }
{                                                       }
{       作者：ChengTX                                   }
{                                                       }
{       时间：2012-06-20 9:35:38                        }
{                                                       }
{*******************************************************}


unit gFilterFrm;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DBGridEh, Buttons, dm;

type
  TfrmFilter = class(TForm)
    pnl2: TPanel;
    btnAdd: TButton;
    pnl1: TPanel;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    btn3: TSpeedButton;
    btn4: TSpeedButton;
    pnl3: TPanel;
    lbl1: TLabel;
    lvRet: TListView;
    pnl4: TPanel;
    lvField: TListView;
    lbl2: TLabel;
    grp1: TGroupBox;
    pgc1: TPageControl;
    tsStr: TTabSheet;
    lbl4: TLabel;
    tsInt: TTabSheet;
    edtInt: TLabeledEdit;
    edtStr: TLabeledEdit;
    btnBCBH: TSpeedButton;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    dtp3: TDateTimePicker;
    dtp4: TDateTimePicker;
    procedure lvFieldChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure btnAddClick(Sender: TObject);
    procedure edtIntKeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnBCBHClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FColArr: array of TColumnEh;
    procedure InitFrm(AColEH: array of TColumnEh);
  end;

implementation

uses
  DB, DateUtils, Pick_Item_Single;

{$R *.dfm}

procedure TfrmFilter.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmFilter.btn2Click(Sender: TObject);
begin
  lvRet.DeleteSelected;
end;

procedure TfrmFilter.btn3Click(Sender: TObject);
begin
  lvRet.Clear;
end;

procedure TfrmFilter.btn4Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmFilter.btnAddClick(Sender: TObject);
var
  I: Integer;
begin
  if lvField.Selected <> nil then
  begin
    for I := 0 to lvRet.Items.Count - 1 do
    begin
      if lvRet.Items[I].Caption = FColArr[lvField.ItemIndex].Title.Caption then
      begin
        case FColArr[lvField.ItemIndex].Field.DataType of
          //int
          ftSmallint,ftInteger,ftWord,ftBytes,ftLargeint:
          begin
            try
              StrToInt(edtInt.Text);
              lvRet.Items[I].SubItems[0] := ' = ' + edtInt.Text;
            except
            end;
          end;
          //string
          ftString,ftWideString,ftReference,ftFixedChar:
          begin
            lvRet.Items[I].SubItems[0] := ' LIKE ' + QuotedStr('%'+edtStr.Text+'%');
          end;
        end;      
        Exit;
      end;
    end;
    case FColArr[lvField.ItemIndex].Field.DataType of
      //int
      ftSmallint,ftInteger,ftWord,ftBytes,ftLargeint:
      begin
        try
          StrToInt(edtInt.Text);
          with lvRet.Items.Add do
          begin
            Caption := FColArr[lvField.ItemIndex].Title.Caption;
            SubItems.Add(' = ' + edtInt.Text);
            SubItems.Add(FColArr[lvField.ItemIndex].Field.FieldName);
          end;
        except
        end;
      end;
      //string
      ftString,ftWideString,ftReference,ftFixedChar:
      begin
        with lvRet.Items.Add do
        begin
          Caption := FColArr[lvField.ItemIndex].Title.Caption;
          SubItems.Add(' LIKE ' + QuotedStr('%'+edtStr.Text+'%'));
          if lvField.Selected.Caption = '申请工序|代码' then
            SubItems.Add('D34SQ.DEPT_CODE')
          else
          if lvField.Selected.Caption = '责任工序|代码' then
            SubItems.Add('D34FS.DEPT_CODE')
          else
          if lvField.Selected.Caption = '申请人' then
            SubItems.Add('D05SQ.EMPLOYEE_NAME')
          else
          SubItems.Add(FColArr[lvField.ItemIndex].Field.FieldName);
        end;
      end;
    end;
  end;
end;

procedure TfrmFilter.btnBCBHClick(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LInPut: PDlgInput;
begin
  LFrm := TfrmPick_Item_Single.Create(Self);
  LInPut.AdoConn := dm1.con1;
  try
    if lvField.Selected = nil then Exit;
    if lvField.Selected.Caption = '本厂编号' then
    begin
      LInPut.KeyField := 'MANU_PART_NUMBER';
      LInPut.Fields := 'MANU_PART_NUMBER/本厂编号,MANU_PART_DESC/客户型号';
      LInPut.Sqlstr := 'SELECT RKey, MANU_PART_NUMBER,MANU_PART_DESC FROM Data0025 WHERE PARENT_PTR = 0 OR PARENT_PTR IS NULL';
    end;
    
    if lvField.Selected.Caption = '客户型号' then
    begin
      LInPut.KeyField := 'MANU_PART_DESC';
      LInPut.Fields := 'MANU_PART_NUMBER/本厂编号,MANU_PART_DESC/客户型号';
      LInPut.Sqlstr := 'SELECT RKey, MANU_PART_NUMBER,MANU_PART_DESC FROM Data0025 WHERE PARENT_PTR = 0 OR PARENT_PTR IS NULL';
    end;

    if lvField.Selected.Caption = '作业单号' then
    begin
      LInPut.KeyField := 'WORK_ORDER_NUMBER';
      LInPut.Fields := 'WORK_ORDER_NUMBER/作业单号';
      LInPut.Sqlstr := 'select WORK_ORDER_NUMBER from data0006';
    end;
//
    if (lvField.Selected.Caption = '责任工序|代码') or
        (lvField.Selected.Caption = '申请工序|代码')
    then
    begin
      LInPut.KeyField := 'DEPT_CODE';
      LInPut.Fields := 'DEPT_CODE/工序代码,DEPT_NAME/工序名称';
      LInPut.Sqlstr := 'select DEPT_CODE,DEPT_NAME from data0034';
    end;
//
    if (lvField.Selected.Caption = '申请人') then
    begin
      LInPut.KeyField := 'EMPLOYEE_NAME';
      LInPut.Fields := 'EMPL_CODE/员工代码,EMPLOYEE_NAME/员工姓名';
      LInPut.Sqlstr := 'select EMPL_CODE,EMPLOYEE_NAME from data0005';
    end;
//
    if (lvField.Selected.Caption = '工厂代码') then
    begin
      LInPut.KeyField := 'WAREHOUSE_CODE';
      LInPut.Fields := 'WAREHOUSE_CODE/工厂代码,ABBR_NAME/工厂名字';
      LInPut.Sqlstr := 'select * from Data0015';
    end;
//
    if (lvField.Selected.Caption = '缺陷代码') then
    begin
      LInPut.KeyField := 'REJ_CODE';
      LInPut.Fields := 'REJ_CODE/缺陷代码,REJECT_DESCRIPTION/缺陷描述';
      LInPut.Sqlstr := 'select REJ_CODE,REJECT_DESCRIPTION,case rej_type when 0 then ''工厂报废''  when 1 then ''供应商报废'' when 2 then ''客户报废'' when 3 then ''市场报废'' end as MYrej_type from data0039';
    end;
    LFrm.InitForm(LInPut);
    if LFrm.ShowModal = mrOK then edtStr.Text := LFrm.Get_Rslt;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmFilter.edtIntKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13,#9]) then
    Key := #0;
end;

procedure TfrmFilter.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnAddClick(btnAdd);
end;


procedure TfrmFilter.InitFrm(AColEH: array of TColumnEh);
var
  I: Integer;
begin
  dtp1.DateTime := Now;
  dtp2.DateTime := 0;
  dtp3.DateTime := IncDay(Now,1);
  dtp4.DateTime := 0;
  lvField.Clear;
  SetLength(FColArr,Length(AColEH));
  for I := 0 to Length(AColEH) - 1 do
  begin
    FColArr[I] := AColEH[I];
    with lvField.Items.Add do Caption := FColArr[I].Title.Caption;
  end;
  if lvField.Items.Count > 0 then
  begin
    lvField.Items[0].Selected := True;
    lvFieldChange(lvField,lvField.Selected,ctText);
  end;
end;

procedure TfrmFilter.lvFieldChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  if lvField.Selected <> nil then
  begin
    case FColArr[lvField.ItemIndex].Field.DataType of
      //int
      ftSmallint,ftInteger,ftWord,ftBytes,ftLargeint:
      begin
        pgc1.ActivePage := tsInt;
        pgc1.ActivePageIndex := tsInt.PageIndex;
        edtInt.EditLabel.Caption := lvField.Selected.Caption;
      end;
      //string
      ftString,ftWideString,ftReference,ftFixedChar:
      begin
        pgc1.ActivePage := tsStr;
        pgc1.ActivePageIndex := tsStr.PageIndex;
        edtStr.EditLabel.Caption := lvField.Selected.Caption;
      end;
    end;
    edtInt.Text := '';
    edtStr.Text := '';
  end;
end;

end.
