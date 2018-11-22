unit FM_Condition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, ExtCtrls, StdCtrls, Buttons, Mask, ComCtrls;

type
  TCondition = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Button1: TButton;
    ListBox1: TListBox;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    SGrid1: TStringGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker1: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    procedure ListBox1Click(Sender: TObject); //
    procedure FormCreate(Sender: TObject);    //
    procedure Edit1Change(Sender: TObject);  //
    procedure Edit1Exit(Sender: TObject); //
    procedure Edit1KeyPress(Sender: TObject; var Key: Char); //
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);   //
    procedure PopupMenu1Popup(Sender: TObject); //
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);

    private
      { Private declarations }
      procedure update_sgrid(sgrid_row:byte);
    public
      { Public declarations }
    end;

var
  Condition: TCondition;

implementation

uses DM,ConstVar,Pick_Item_Single,common;

{$R *.dfm}

procedure TCondition.FormCreate(Sender: TObject);
begin
     sgrid1.Cells[0,0]:='条件名称';
     sgrid1.Cells[1,0]:='条件值';
     ListBox1.ItemIndex := 0;
     self.ListBox1Click(Sender);
     dtpk1.Date := common.getsystem_date(f_dm.ADOQuery1,0)-90;
     dtpk2.Date := common.getsystem_date(f_dm.ADOQuery1,0)+1;
     //RadioGroup1Click(Sender);
end;
//
procedure TCondition.ListBox1Click(Sender: TObject);
begin
    Label1.Caption := ListBox1.Items[ListBox1.itemindex] + ' ： ';
    Edit1.Text := '';
    BitBtn1.Visible := ListBox1.ItemIndex in [0,1,2,3];

end;

procedure TCondition.Edit1Change(Sender: TObject);
begin
    if Trim(Edit1.Text) <> '' then
      Button1.Enabled := True
    else
      Button1.Enabled := False;

end;

procedure TCondition.Edit1Exit(Sender: TObject);
begin
   if (ListBox1.ItemIndex <> 1) and (Trim(Edit1.Text) <> '') then
    begin
       with F_DM.AQTmp do
        begin
          Close;
           if RadioGroup1.itemindex = 1  then
             begin
                 case ListBox1.ItemIndex of
                  0: SQL.Text := 'select rkey from data0017 where data0017.inv_part_number ='''+trim(edit1.Text)+'''';
                  1: sql.Text := 'select rkey from data0023 where data0023.code='''+trim(edit1.Text)+'''';
                  2: SQL.Text := 'select rkey from data0005 where data0005.EMPL_CODE='''+trim(edit1.Text)+'''';
                  3: SQL.Text := 'select rkey from data0005 where data0005.EMPL_CODE='''+trim(edit1.Text)+'''';
                 end;
             end
           else
             begin
                 case ListBox1.ItemIndex of
                  0: SQL.Text := 'select rkey from data0017 where data0017.inv_part_number like ''%'+trim(edit1.Text)+'%''';
                  1: sql.Text := 'select rkey from data0023 where data0023.code like ''%'+trim(edit1.Text)+'%''';
                  2: SQL.Text := 'select rkey from data0005 where data0005.EMPL_CODE like ''%'+trim(edit1.Text)+'%''';
                  3: SQL.Text := 'select rkey from data0005 where data0005.EMPL_CODE like ''%'+trim(edit1.Text)+'%''';
                 end;
             end;
          Open;
          {if IsEmpty then
            begin
              ShowMessage(Label1.Caption + '输入错误，请重新输入！');
              edit1.Text := '';
              Edit1.SetFocus;
            end; }
        end;

    end;
end;

procedure TCondition.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
      Button1.SetFocus;
end;

procedure TCondition.BitBtn1Click(Sender: TObject);
var inputvar: PDlgInput;
begin
    frmpick_item_single:=Tfrmpick_item_single.Create(application);
    try
      case ListBox1.ItemIndex of
         0:
           begin
              inputvar.Fields:='code/材料编码/200,name/材料描述/300';
              inputvar.Sqlstr:='select rkey,inv_part_number as code,inv_part_description as name from data0017 order by inv_part_number';
              inputvar.KeyField:='code';
           end;
         1:
           begin
              inputvar.Fields:='code/供应商代码/100,name/供应商名称/270';
              inputvar.Sqlstr:='select rkey,code,supplier_name as name from data0023 order by code';
              inputvar.KeyField:='code';
           end;
         2:
           begin
              inputvar.Fields:='code/员工代码/130,name/员工名称/240';
              inputvar.Sqlstr:='select rkey,EMPL_CODE as code,EMPLOYEE_NAME as name from data0005 order by EMPL_CODE';
              inputvar.KeyField:='code';
           end;
         3:
           begin
              inputvar.Fields:='code/员工代码/130,name/员工名称/240';
              inputvar.Sqlstr:='select rkey,EMPL_CODE as code,EMPLOYEE_NAME as name from data0005 order by EMPL_CODE';
              inputvar.KeyField:='code';
           end;
      end;

      inputvar.InPut_value := Edit1.Text;
      inputvar.AdoConn := F_DM.ADOConnection1;
      frmPick_Item_Single.InitForm_New(inputvar);
      if frmPick_Item_Single.ShowModal = mrok then
       begin
         Edit1.Text := Trim(frmPick_Item_Single.adsPick.FieldValues['code']);
         Button1.SetFocus;
       end
      else
       begin
         Edit1.SetFocus;
       end;

    finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free;
    end;

end;

procedure TCondition.Button1Click(Sender: TObject);
var i:byte;
begin
    for  i := 1 to SGrid1.RowCount-2 do
     if SGrid1.Cells[0,i] = ListBox1.Items[ListBox1.ItemIndex] then
      begin
        Update_sgrid(i);
        Exit;
      end;
     update_sgrid(sgrid1.RowCount-1);
     sgrid1.RowCount:=sgrid1.RowCount+1;

end;

procedure TCondition.update_sgrid(sgrid_row: byte);
begin
    sgrid1.Cells[0,sgrid_row]:=listbox1.Items[listbox1.itemindex];
    sgrid1.Cells[1,sgrid_row]:=trim(edit1.Text);
    if RadioGroup1.ItemIndex = 1 then
      begin
        case listbox1.ItemIndex of
          0:sgrid1.Cells[2,sgrid_row]:=' and Data0017.inv_part_number='''+trim(edit1.Text)+'''';
          1:sgrid1.Cells[2,sgrid_row]:=' and data0023.code='''+trim(edit1.Text)+'''';
          2:sgrid1.Cells[2,sgrid_row]:=' and d05.EMPL_CODE='''+trim(edit1.Text)+'''';
          3:sgrid1.Cells[2,sgrid_row]:=' and d05_1.EMPL_CODE='''+trim(edit1.Text)+'''';
          end;
      end
    else
      begin
        case listbox1.ItemIndex of
          0:sgrid1.Cells[2,sgrid_row]:=' and Data0017.inv_part_number like ''%'+trim(edit1.Text)+'%''';
          1:sgrid1.Cells[2,sgrid_row]:=' and data0023.code like  ''%'+trim(edit1.Text)+'%''';
          2:sgrid1.Cells[2,sgrid_row]:=' and d05.EMPL_CODE like ''%'+trim(edit1.Text)+'%''';
          3:sgrid1.Cells[2,sgrid_row]:=' and d05_1.EMPL_CODE like ''%'+trim(edit1.Text)+'%''';
          end;
      end;
    
end;
 //删除
procedure TCondition.N1Click(Sender: TObject);
var i:byte;
begin
     if sgrid1.RowCount>2 then
      begin
       for i:=sgrid1.Row to sgrid1.RowCount-2 do
        sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
       sgrid1.RowCount:=sgrid1.RowCount-1;
      end
     else sgrid1.Rows[sgrid1.Row].Clear;
end;

procedure TCondition.PopupMenu1Popup(Sender: TObject);
begin
    if (sgrid1.Row>0) and (sgrid1.Row<sgrid1.RowCount-1) then
      n1.Enabled:=true
    else n1.Enabled:=false;  
end;
//重置
procedure TCondition.BitBtn3Click(Sender: TObject);
var i:byte;
begin
    for i:=1 to sgrid1.RowCount-1 do
      sgrid1.Rows[i].Clear;
      sgrid1.RowCount:=2;

end;






procedure TCondition.BitBtn4Click(Sender: TObject);
begin
     close
end;

procedure TCondition.RadioGroup1Click(Sender: TObject);
begin
     if RadioGroup1.ItemIndex = 0 then
       begin
         Edit1.ReadOnly := False;
        // Edit1.ReadOnly := (ListBox1.ItemIndex = 0 ) or (ListBox1.ItemIndex = 1) or (ListBox1.ItemIndex = 2) or (ListBox1.ItemIndex = 3);
        // Edit1.Text := '';

       end
     else
       begin
         Edit1.ReadOnly := True;
       //  Edit1.ReadOnly := (ListBox1.ItemIndex = 0 ) or (ListBox1.ItemIndex = 1) or (ListBox1.ItemIndex = 2) or (ListBox1.ItemIndex = 3);
       end;
end;

end.
