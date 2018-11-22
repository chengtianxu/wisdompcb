unit IF_Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, Grids,DateUtils, ExtCtrls
  ;

type
  TIf_Form1 = class(TForm)
    StaticText2: TStaticText;
    sgrid1: TStringGrid;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox2: TGroupBox;
    ListBox2: TListBox;
    StaticText3: TStaticText;
    BitBtn7: TBitBtn;
    Edit2: TEdit;
    Label2: TLabel;
    BitBtn8: TBitBtn;
    ComboBox1: TComboBox;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn8Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
    vparametersvalue1:string;
    vparametersvalue2:string;
    vparametersvalue3:string;
    vparametersvalue4:string;
    vparametersvalue5:string;
    vparametersvalue6:string;
    vparametersvalue7:string;
    procedure update2_sgrid(sgrid_row:integer);
    procedure update_sgrid;
  public

  end;

var
  If_Form1: TIf_Form1;

implementation
uses
   DM,Pick_Item_Single,ConstVar;


{$R *.dfm}

procedure TIf_Form1.BitBtn5Click(Sender: TObject);
var
 i:byte;
begin
  for i:=1 to sgrid1.RowCount-1 do sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;

procedure TIf_Form1.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
     sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TIf_Form1.sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  bitbtn4.Enabled:=sgrid1.Row<>sgrid1.RowCount-1;
end;

procedure TIf_Form1.sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;
begin
  if button=mbright then
      begin
          SGrid1.MouseToCell(x,y,column,row);
          if (row>0) and (row<sgrid1.RowCount-1) then SGrid1.Row:=row;
      end;
end;

procedure TIf_Form1.update2_sgrid(sgrid_row: integer);
begin
  if ListBox2.Items[ListBox2.ItemIndex] = '本厂编号' then
  begin
    sgrid1.Cells[1,sgrid_row] := edit2.Text;
    sgrid1.Cells[2,sgrid_row] := 'and MANU_PART_NUMBER LIKE ''%' + trim(edit2.Text) + '%''' ;
  end else
  if ListBox2.Items[ListBox2.ItemIndex] = '客户型号' then
  begin
    sgrid1.Cells[1,sgrid_row] := edit2.Text;
    sgrid1.Cells[2,sgrid_row] := 'and MANU_PART_DESC LIKE ''%' + trim(edit2.Text) + '%''';
  end else
  if ListBox2.Items[ListBox2.ItemIndex] = '作业单号' then
  begin
    sgrid1.Cells[1,sgrid_row]:=edit2.Text;
    sgrid1.Cells[2,sgrid_row]:='and WORK_ORDER_NUMBER LIKE ''%'+ trim(edit2.Text)+'%''';
  end else
  if ListBox2.Items[ListBox2.ItemIndex] = '投料单号' then
  begin
    sgrid1.Cells[1,sgrid_row]:=edit2.Text;
    sgrid1.Cells[2,sgrid_row]:='and CUT_NO LIKE ''%'+ trim(edit2.Text)+'%''';
  end else
  if ListBox2.Items[ListBox2.ItemIndex] = '销售订单号' then
  begin
    sgrid1.Cells[1,sgrid_row]:=edit2.Text;
    sgrid1.Cells[2,sgrid_row]:='and sales_order LIKE ''%'+trim(edit2.Text)+'%''';
  end else
  if ListBox2.Items[ListBox2.ItemIndex] = '工厂' then
  begin
    sgrid1.Cells[1,sgrid_row]:=ComboBox1.Text;
    sgrid1.Cells[2,sgrid_row]:='and d15.abbr_name='''+ComboBox1.Text+'''';
  end;      
// case listbox2.ItemIndex of
//     0:begin
//          sgrid1.Cells[1,sgrid_row] := edit2.Text;
//          sgrid1.Cells[2,sgrid_row] := 'and MANU_PART_NUMBER LIKE ''%' + trim(edit2.Text) + '%''' ;
//       end;
//     1:begin
//          sgrid1.Cells[1,sgrid_row] := edit2.Text;
//          sgrid1.Cells[2,sgrid_row] := 'and MANU_PART_DESC LIKE ''%' + trim(edit2.Text) + '%''';
//       end;
//     2:begin
//          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
//          sgrid1.Cells[2,sgrid_row]:='and WORK_ORDER_NUMBER LIKE ''%'+ trim(edit2.Text)+'%''';
//
//       end;
//     3:begin
//          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
//          sgrid1.Cells[2,sgrid_row]:='and CUT_NO LIKE ''%'+ trim(edit2.Text)+'%''';
//       end;
//     4:begin
//          sgrid1.Cells[1,sgrid_row]:=edit2.Text;
//          sgrid1.Cells[2,sgrid_row]:='and SO_NO LIKE ''%'+trim(edit2.Text)+'%''';
//       end;
//     5:begin
//          sgrid1.Cells[1,sgrid_row]:=ComboBox1.Text;
//          sgrid1.Cells[2,sgrid_row]:='and d15.abbr_name='''+ComboBox1.Text+'''';
//       end;
//     end;

end;

procedure TIf_Form1.BitBtn8Click(Sender: TObject);
begin
  update_sgrid; //新增内容
end;

procedure TIf_Form1.update_sgrid;
var
  i:integer;
begin
  //检查是不是已有加在sgrid1中的内容，没有就增加
  for i:=1 to sgrid1.RowCount-2 do
     if (sgrid1.Cells[0,i]=listbox2.Items[listbox2.ItemIndex]) and
        (sgrid1.Cells[1,i]<>listbox2.Items[listbox2.ItemIndex]) then
         begin
             update2_sgrid(i);
             exit;
         end;
  //更新0列记录
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox2.Items[listbox2.itemindex];
  update2_sgrid(sgrid1.RowCount-1);
  //增加一行空的记录
  sgrid1.RowCount :=sgrid1.RowCount +1;
end;

procedure TIf_Form1.ListBox2Click(Sender: TObject);
begin
  label2.Caption:=' '+listbox2.Items[listbox2.itemindex]+':  ';
  edit2.Text:='';
  edit2.Visible := true;
  bitbtn7.Visible:=false;
  bitbtn8.Enabled:=listbox2.ItemIndex=5;
  ComboBox1.Visible:=listbox2.ItemIndex=5;
end;

procedure TIf_Form1.FormShow(Sender: TObject);
begin
  sgrid1.Cells[0,0] := '条件名';
  sgrid1.Cells[1,0] := '条件值';

  SELF.ListBox2.ItemIndex := 0;
  self.ListBox2Click(SELF.ListBox2);
end;

procedure TIf_Form1.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  case listbox2.ItemIndex of
      0,1,2,3:
         begin
              frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
              try
                  if listbox2.ItemIndex = 1 then
                      begin
                       InputVar.Fields := 'MANU_PART_NUMBER/部件编号/400';
                       InputVar.Sqlstr := 'select RKEY,MANU_PART_NUMBER from data0025';
                      end
                  else if listbox2.ItemIndex = 2 then
                      begin
                       InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/400';
                       InputVar.Sqlstr := 'select RKEY,MANU_PART_NUMBER from data0025 where PARENT_PTR = 0 or PARENT_PTR is null';
                      end
                  else if listbox2.ItemIndex = 3 then
                      begin
                          InputVar.Fields := 'SALES_ORDER/订单号/400';
                          InputVar.Sqlstr := 'select DISTINCT rkey,SALES_ORDER from data0060';
                      end
                  else if listbox2.ItemIndex = 0 then
                      begin
                          InputVar.Fields := 'CUT_NO/配料单号/400';
                          InputVar.Sqlstr := 'select DISTINCT RKEY,CUT_NO from data0492 where cut_no is not null and cut_no <> ''''';
                     end;

                  InputVar.AdoConn := DM1.con1 ;
                  frmPick_Item_Single.InitForm_New(InputVar)  ;
                  if frmPick_Item_Single.ShowModal=mrok then
                       begin
                            if listbox2.ItemIndex = 0 then
                                 edit2.Text := frmPick_Item_Single.adsPick.FieldValues['CUT_NO']
                            else if listbox2.ItemIndex = 1 then
                                 edit2.Text := frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']
                            else if listbox2.ItemIndex = 2 then
                                 edit2.Text := frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']
                            else if listbox2.ItemIndex = 3 then
                                 edit2.Text := frmPick_Item_Single.adsPick.FieldValues['SALES_ORDER'];
                            if edit2.Text <>'' then
                                BitBtn8.Enabled := true ;
                       end;
              finally
                  frmPick_Item_Single.adsPick.Close;
                  frmPick_Item_Single.Free ;
              end;
         end;

      end;
end;

procedure TIf_Form1.FormCreate(Sender: TObject);
begin
  self.BorderIcons := self.BorderIcons - [biMinimize] - [biMaximize];
  self.BorderStyle  := bsSingle;
  self.Position := poScreenCenter;
  if dm1.SqlOpen('select abbr_name from data0015') then
  begin
    while not DM1.qrytmp.Eof do
    begin
      ComboBox1.Items.Append(DM1.qrytmp.Fields[0].asstring);
      ComboBox1.ItemIndex:=0;
      DM1.qrytmp.Next;
    end;
  end;
end;

procedure TIf_Form1.Edit2Change(Sender: TObject);
begin
  bitbtn8.Enabled:=trim(edit2.Text)<>'';
end;

end.
