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
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    ComboBox2: TComboBox;
    lab_rkey15: TLabel;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn8Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
    function Get_parametersvalue1: string;
    function Get_parametersvalue2: string;
    function Get_parametersvalue3: string;
    function Get_parametersvalue4: string;
    function Get_parametersvalue5: string;
    function Get_parametersvalue6: string;
    function Get_parametersvalue7: string;
  public
    { Public declarations }
    property parametersvalue1:string read Get_parametersvalue1;
    property parametersvalue2:string read Get_parametersvalue2;
    property parametersvalue3:string read Get_parametersvalue3;
    property parametersvalue4:string read Get_parametersvalue4;
    property parametersvalue5:string read Get_parametersvalue5;
    property parametersvalue6:string read Get_parametersvalue6;
    property parametersvalue7:string read Get_parametersvalue7;
  end;

var
  If_Form1: TIf_Form1;

implementation


uses
   DMUnit1
   ,Pick_Item_Single
   ,ConstVar;

{uses

   find_CUSTOMER_PART_DESC_Unit2
   ,find_CUSTOMER_PART_NUMBER_Unit2
   , findUnit1,Unit4
   ,Unit5 ; {}

{$R *.dfm}

procedure TIf_Form1.BitBtn5Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
    sgrid1.Rows[i].Clear;
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

procedure TIf_Form1.BitBtn6Click(Sender: TObject);
begin
  modalresult:=mrCancel	;
end;

procedure TIf_Form1.BitBtn3Click(Sender: TObject);
var
 i:integer;
 n1,n2,n0,n3,n4,n5,n6,n7:integer;
begin
  hide;
  vparametersvalue1:='';
  vparametersvalue2:='';
  vparametersvalue3:='';
  vparametersvalue4:='';
  vparametersvalue5:='';
  vparametersvalue6:='';
  vparametersvalue7:='';
  for i := 1 to sgrid1.RowCount - 2  do
      begin
          //showmessage(sgrid1.Cells[2,i]);
          n0:=length(trim(sgrid1.Cells[2,i]));
          n1:=length(vparametersvalue1);
          if n1 + n0 < 99 then
              begin
                vparametersvalue1 := vparametersvalue1 + ' ' + trim(sgrid1.Cells[2,i]);
              end
          else
              begin
                  n2 := length(vparametersvalue2);
                  if n2 + n0 < 99 then
                      begin
                         vparametersvalue2 := vparametersvalue2 + ' ' + trim(sgrid1.Cells[2,i]);
                      end
                  else
                      begin
                          n3 := length(vparametersvalue3);
                          if n3 + n0 < 99 then
                              begin
                                 vparametersvalue3 := vparametersvalue3 + ' ' + trim(sgrid1.Cells[2,i]);
                              end
                          else
                              begin
                                  n4 := length(vparametersvalue4);
                                  if n4 + n0 < 99 then
                                      begin
                                         vparametersvalue4 := vparametersvalue4 + ' ' + trim(sgrid1.Cells[2,i]);
                                      end
                                  else
                                      begin
                                          n5:=length(vparametersvalue5);
                                          if n5+n0<99 then
                                              begin
                                                 vparametersvalue5 := vparametersvalue5 + ' ' + trim(sgrid1.Cells[2,i]);
                                              end
                                          else
                                              begin
                                                  n6 := length(vparametersvalue6);
                                                  if n6 + n0 < 99 then
                                                      begin
                                                         vparametersvalue6 := vparametersvalue6 + ' ' + trim(sgrid1.Cells[2,i]);
                                                      end
                                                  else
                                                      begin
                                                          n7 := length(vparametersvalue7);
                                                          if n7 + n0 < 99 then
                                                              begin
                                                                 vparametersvalue7 := vparametersvalue7 + ' ' + trim(sgrid1.Cells[2,i]);
                                                              end
                                                          else
                                                              begin
                                                              end;
                                                      end;
                                              end;
                                      end;
                              end;
                      end;
              end;
      end;
  //showmessage(v1+' '+v2);

  modalresult:=mrok;
end;

procedure TIf_Form1.sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
 //只允许删除倒数第一行之前的行
 if sgrid1.Row = sgrid1.RowCount - 1 then
  bitbtn4.Enabled := false
 else
  bitbtn4.Enabled := true;
end;

procedure TIf_Form1.sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;
begin
 if button = mbright then
  begin
   SGrid1.MouseToCell(x,y,column,row);
   if (row > 0) and (row < sgrid1.RowCount - 1) then SGrid1.Row := row;
  end;
end;

procedure TIf_Form1.update2_sgrid(sgrid_row: integer);
begin
 sgrid1.Cells[0,sgrid_row] := listbox2.Items[listbox2.itemindex];
 case listbox2.ItemIndex of
     0:begin
        sgrid1.Cells[1,sgrid_row] := edit2.Text;
        sgrid1.Cells[2,sgrid_row] := ' and data0010.CUST_CODE = ''' + trim(edit2.Text) + '''';
       end;
     1:begin
        sgrid1.Cells[1,sgrid_row] := edit2.Text;
        sgrid1.Cells[2,sgrid_row] := ' and data0025.MANU_PART_NUMBER LIKE ''%' + trim(edit2.Text) + '%''';
       end;
     2:begin   //
        sgrid1.Cells[1,sgrid_row] := edit2.Text;
        sgrid1.Cells[2,sgrid_row] := ' and Data0492.SO_NO LIKE ''%'+trim(edit2.Text)+'%''';
       end;
     3:begin   //
        sgrid1.Cells[1,sgrid_row] := edit2.Text;
        sgrid1.Cells[2,sgrid_row] := ' and Data0492.CUT_NO LIKE ''%'+trim(edit2.Text)+'%''';
       end;
     4:begin   //
        sgrid1.Cells[1,sgrid_row] := edit2.Text;
        sgrid1.Cells[2,sgrid_row] := ' and  data0025.MANU_PART_DESC LIKE ''%' + trim(edit2.Text) + '%''';
       end;
     5:begin   //
        sgrid1.Cells[1,sgrid_row] := ComboBox2.Text ;
        sgrid1.Cells[2,sgrid_row] := ' and  data0492.ttype = ' + inttostr(ComboBox2.ItemIndex);
       end;
    6:begin
       sgrid1.Cells[1,sgrid_row] := ComboBox2.Text;
       if ComboBox2.ItemIndex = 1 then     //内层
        sgrid1.Cells[2,sgrid_row]:=' and (DATA0025.PARENT_PTR > 0)'
       else
        sgrid1.Cells[2,sgrid_row]:=' and (DATA0025.PARENT_PTR is null)';
      end;
    7:begin
       sgrid1.Cells[1,sgrid_row] := ComboBox2.Text;
       if ComboBox2.ItemIndex = 0 then     //确认状态
        sgrid1.Cells[2,sgrid_row]:=' and (DATA0492.con_flag = 0)'
       else
        sgrid1.Cells[2,sgrid_row]:=' and (DATA0492.con_flag = 2)';
      end;
    8:begin
       sgrid1.Cells[1,sgrid_row] := ComboBox2.Text;
       if ComboBox2.ItemIndex = 0 then     //列印标识
        sgrid1.Cells[2,sgrid_row]:=' and (data0492.printed_by_ptr = 0)'
       else
        sgrid1.Cells[2,sgrid_row]:=' and (data0492.printed_by_ptr > 0)';
      end;
    9:
     begin
      sgrid1.Cells[1,sgrid_row] := edit2.Text;
      sgrid1.Cells[2,sgrid_row]:=' and data0492.WHOUSE_PTR = '+SELF.lab_rkey15.Caption;
     end;
 10:
  begin
   sgrid1.Cells[2,sgrid_row]:=' and data0025.ttype='+inttostr(combobox2.itemindex);
   sgrid1.Cells[1,sgrid_row]:=combobox2.Text;
  end;

   end;

end;

procedure TIf_Form1.BitBtn8Click(Sender: TObject);
var
  i:integer;
begin
 for i:=1 to sgrid1.RowCount - 2 do
  if (sgrid1.Cells[0,i] = listbox2.Items[listbox2.ItemIndex]) then
   begin
    update2_sgrid(i);
    exit;
   end;

  update2_sgrid(sgrid1.RowCount - 1);
  sgrid1.RowCount :=sgrid1.RowCount + 1;

//  update_sgrid; //新增内容
end;


procedure TIf_Form1.ListBox2Click(Sender: TObject);
begin

  label2.Caption := listbox2.Items[listbox2.itemindex];

  edit2.Text := '';
  edit2.Visible := false;
  bitbtn7.Visible := false;
  bitbtn8.Enabled := false;
  ComboBox2.Visible := false;
  edit2.ReadOnly := false;
  case listbox2.ItemIndex of

      0:
          begin
           edit2.Visible := true;
           BitBtn7.Visible :=true;
          end;
      1:
          begin
           edit2.Visible := true;
           BitBtn7.Visible :=true;
          end;
      2:
          begin
           edit2.Visible := true;
          end;
      3:
          begin
           edit2.Visible := true;
          end;
      4:
          begin
           edit2.Visible := true;
          end;
      5:
          begin
            ComboBox2.Left := edit2.Left ;
            ComboBox2.Top := edit2.Top ;
            ComboBox2.Visible := true;
            combobox2.Items.Clear;
            combobox2.Items.Add('订单投产');
            combobox2.Items.Add('补料投产');
            combobox2.Items.Add('按MRB重投');
            combobox2.Items.Add('按MRB返修');
            combobox2.Items.Add('按板号投产');
            combobox2.ItemIndex:=0;
            BitBtn8.Enabled := true;
          end;
      6:
          begin
            ComboBox2.Left := edit2.Left ;
            ComboBox2.Top := edit2.Top ;
            ComboBox2.Visible := true;
            combobox2.Items.Clear;
            combobox2.Items.Add('外层');
            combobox2.Items.Add('内层');
            combobox2.ItemIndex:=0;
            BitBtn8.Enabled := true;
          end;
      7:
          begin
            ComboBox2.Left := edit2.Left ;
            ComboBox2.Top := edit2.Top ;
            ComboBox2.Visible := true;
            combobox2.Items.Clear;
            combobox2.Items.Add('未确认');
            combobox2.Items.Add('已确认');
            combobox2.ItemIndex:=0;
            BitBtn8.Enabled := true;
          end;
      8:
          begin
            ComboBox2.Left := edit2.Left ;
            ComboBox2.Top := edit2.Top ;
            ComboBox2.Visible := true;
            combobox2.Items.Clear;
            combobox2.Items.Add('未列印');
            combobox2.Items.Add('已列印');
            combobox2.ItemIndex:=0;
            BitBtn8.Enabled := true;
          end;
      9:
          begin
           edit2.Visible := true;
           BitBtn7.Visible :=true;
           edit2.ReadOnly := true;
          end;
      10:
          begin
            ComboBox2.Left := edit2.Left ;
            ComboBox2.Top := edit2.Top ;
            ComboBox2.Visible := true;
            combobox2.Items.Clear;
            combobox2.Items.Add('量产');
            combobox2.Items.Add('样板');
            combobox2.ItemIndex:=0;
            BitBtn8.Enabled := true;
          end;


    end;
end;

procedure TIf_Form1.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if trim(edit2.Text) <> '' then
      bitbtn8.Enabled := true
  else
      bitbtn8.Enabled := false;
end;

procedure TIf_Form1.FormShow(Sender: TObject);
begin
  sgrid1.Cells[0,0] := '条件名';
  sgrid1.Cells[1,0] := '条件值';

  vparametersvalue1 := '';
  vparametersvalue2 := '';
  vparametersvalue3 := '';
  vparametersvalue4 := '';
  vparametersvalue5 := '';
  vparametersvalue6 := '';
  vparametersvalue7 := '';

  SELF.ListBox2.ItemIndex := 0;
  self.ListBox2Click(SELF.ListBox2);
end;

function TIf_Form1.Get_parametersvalue1: string;
begin
  result:=vparametersvalue1;
end;

function TIf_Form1.Get_parametersvalue2: string;
begin
  result:=vparametersvalue2;
end;

function TIf_Form1.Get_parametersvalue3: string;
begin
  result:=vparametersvalue3;
end;

function TIf_Form1.Get_parametersvalue4: string;
begin
  result:=vparametersvalue4;
end;

function TIf_Form1.Get_parametersvalue5: string;
begin
  result:=vparametersvalue5;
end;

function TIf_Form1.Get_parametersvalue6: string;
begin
  result:=vparametersvalue6;
end;

function TIf_Form1.Get_parametersvalue7: string;
begin
  result:=vparametersvalue7;
end;

procedure TIf_Form1.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
      if listbox2.ItemIndex = 0 then
       begin
        InputVar.Fields := 'CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,'+
                            'abbr_name/简称/125';
        InputVar.Sqlstr :=
        'SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,'+#13+
        'data0010.abbr_name FROM dbo.Data0010'+#13+
        'order  by cust_code';
        inputvar.InPut_value:=edit2.Text;
        inputvar.KeyField:='CUST_CODE';
       end
      else
     if listbox2.ItemIndex = 1 then
       begin
    InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/89,MANU_PART_DESC/客户型号/149,'+
    'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';
    InputVar.Sqlstr :=
'SELECT dbo.Data0025.PROD_CODE_PTR, dbo.Data0008.PROD_CODE,'+#13+
      'dbo.Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE,'+#13+
      'dbo.Data0010.ABBR_NAME, dbo.Data0025.RKEY AS rkey25,'+#13+
      'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+#13+
      'dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.set_lngth, dbo.Data0025.set_width,'+#13+
      'dbo.Data0025.set_qty'+#13+
'FROM dbo.Data0025 INNER JOIN'+#13+
      'dbo.Data0008 ON'+#13+
      'dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN'+#13+
      'dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
//  'where PARENT_PTR is null'+#13+
'order by dbo.Data0025.MANU_PART_NUMBER';

    inputvar.InPut_value:=edit2.Text;
    inputvar.KeyField:='MANU_PART_NUMBER';
       end
     else
     if listbox2.ItemIndex = 9 then
     begin
     InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,WAREHOUSE_NAME/工厂名称/277';
     InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME from data0015';
     inputvar.InPut_value:=edit2.Text;
     inputvar.KeyField:='WAREHOUSE_CODE';
     end;

      InputVar.AdoConn := DM.ADOConnection1 ;
      frmPick_Item_Single.InitForm_New(InputVar)  ;
      if frmPick_Item_Single.ShowModal = mrok then
       begin
        if listbox2.ItemIndex = 0 then
         edit2.Text := frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']
        else
         if listbox2.ItemIndex = 1 then
          edit2.Text := frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']
         else
          begin
          lab_rkey15.Caption := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsString;
          edit2.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
          end;
        BitBtn8.Enabled := true ;
        bitbtn8.SetFocus;
       end;
  finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
  end;


end;

procedure TIf_Form1.FormCreate(Sender: TObject);
begin
  self.BorderIcons := self.BorderIcons - [biMinimize] - [biMaximize];
  self.BorderStyle  := bsSingle;
  self.Position := poScreenCenter;
end;

end.
