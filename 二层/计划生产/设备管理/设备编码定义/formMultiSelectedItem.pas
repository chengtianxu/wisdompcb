unit formMultiSelectedItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  DB, ADODB,  DBGridEh, Menus, StdCtrls,
  ExtCtrls, Grids, Buttons;

type
  TfrmMultiSelectedItem = class(TForm)
    ds1: TDataSource;
    PopupMenu1: TPopupMenu;
    mniNCanSelected: TMenuItem;
    pnl1: TPanel;
    pnl2: TPanel;
    Dgh1: TDBGridEh;
    btnOK: TButton;
    btnCancel: TButton;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    FieldLabel: TLabel;
    Edit1: TEdit;
    bt1: TSpeedButton;
    procedure Dgh1KeyPress(Sender: TObject; var Key: Char);
    procedure Dgh1DblClick(Sender: TObject);
    procedure mniNCanSelectedClick(Sender: TObject);
    procedure Dt1BeforeInsert(DataSet: TDataSet);
    procedure Dgh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Dgh1ColEnter(Sender: TObject);
    procedure Dgh1Enter(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    FilterFieldName:string;  
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMultiSelectedItem: TfrmMultiSelectedItem;


implementation

uses    dmo;

{$R *.dfm}

procedure TfrmMultiSelectedItem.Dgh1KeyPress(Sender: TObject; var Key: Char);
begin {
 if Key=#13 then
 begin
  Dt1.DisableControls;
  dt1.First;
  while not Dt1.Eof do
  begin
     if Dgh1.FieldColumns['选择'].Field.AsBoolean=True then
       begin
          MainForm.DtChild.Append;
          MainForm.DtChild.FieldByName('MainContName').Value:=Dt1.FieldByName('MainContName').Value;
          MainForm.DtChild.FieldByName('MainPart').Value    :=Dt1.FieldByName('MainPart').Value;
          MainForm.DtChild.FieldByName('SpecRequ').Value    :=Dt1.FieldByName('SpecRequ').Value;
          MainForm.DtChild.FieldByName('Remarks').Value     :=Dt1.FieldByName('Remarks').Value;
          MainForm.DtChild.Post;

          Dt1.Edit;
          Dt1.FieldByName('选择').AsBoolean:=False;
          Dt1.Post;
       end;
     Dt1.Next;
  end;
  Dt1.EnableControls;
  Self.Close;
 end ;  }
end;

procedure TfrmMultiSelectedItem.Dgh1DblClick(Sender: TObject);
begin
//if (Dt1.State=dsInsert)or (Dt1.State=dsEdit)then
//Dt1.Post;
 { Dt1.DisableControls;
  dt1.First;
  while not Dt1.Eof do
  begin
     if Dgh1.FieldColumns['选择'].Field.AsBoolean=True then
       begin
          MainForm.DtChild.Append;
          MainForm.DtChild.FieldByName('MainContName').Value:=Dt1.FieldByName('MainContName').Value;
          MainForm.DtChild.FieldByName('MainPart').Value    :=Dt1.FieldByName('MainPart').Value;
          MainForm.DtChild.FieldByName('SpecRequ').Value    :=Dt1.FieldByName('SpecRequ').Value;
          MainForm.DtChild.FieldByName('Remarks').Value     :=Dt1.FieldByName('Remarks').Value;
          MainForm.DtChild.Post;

          Dt1.Edit;
          Dt1.FieldByName('选择').AsBoolean:=False;
          Dt1.Post;
       end;
     Dt1.Next;
  end;
  Dt1.EnableControls;

Close;    }
end;

procedure TfrmMultiSelectedItem.mniNCanSelectedClick(Sender: TObject);
begin
 { try
   dt1.DisableControls ;
     Dt1.First;
     while not( Dt1.Eof ) do
     begin
       if  Dt1.FieldByName('选择').AsBoolean=True then
       begin
         Dt1.Edit ;
         Dt1.FieldByName('选择').AsBoolean:=False;
         Dt1.Post;
         Dt1.Next;
         ShowMessage('next');
       end;
     end
  finally
   Dt1.EnableControls;
  end;  }

end;

procedure TfrmMultiSelectedItem.Dt1BeforeInsert(DataSet: TDataSet);
begin
Abort;
end;

procedure TfrmMultiSelectedItem.Dgh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then     // .SumList
   Background := $00FFC4C4;
end;

procedure TfrmMultiSelectedItem.FormShow(Sender: TObject);
begin
  with Dgh1.DataSource.DataSet as TADOQuery do
//  if Active=False then
  begin
//    Close;
//    Parameters.ParamByName('vrkey').Value:=DM.ADO417RKEY.Value;
//    Open;
    FieldByName('Rkey').Visible:=False;

    FieldByName('selected').DisplayLabel:='选择';
    FieldByName('selected').DisplayWidth:=4;
    FieldByName('FASSET_CODE').DisplayLabel:='设备编码';
    FieldByName('FASSET_CODE').DisplayWidth:=12;
    FieldByName('FASSET_NAME').DisplayLabel:='设备名称';
    FieldByName('FASSET_NAME').DisplayWidth:=18;
    FieldByName('FASSET_DESC').DisplayLabel:='规格型号';
    FieldByName('FASSET_DESC').DisplayWidth:=10;
    FieldByName('equipment_grade').DisplayLabel:='设备级别';
    FieldByName('equipment_grade').DisplayWidth:=10;
    FieldByName('FASSET_TYPE').DisplayLabel:='设备类别';
    FieldByName('FASSET_TYPE').DisplayWidth:=10;
    FieldByName('DeviType').DisplayLabel:='保养类型';
    FieldByName('DeviType').DisplayWidth:=8;
    FieldByName('DEPT_NAME').DisplayLabel:='使用部门';
    FieldByName('DEPT_NAME').DisplayWidth:=10;
    FieldByName('LOCATION').DisplayLabel:='具体位置';
    FieldByName('LOCATION').DisplayWidth:=10;
    FieldByName('active_flag').DisplayLabel:='状态';
    FieldByName('active_flag').DisplayWidth:=8;
    FieldByName('ABBR_NAME').DisplayLabel:='工厂';
    FieldByName('ABBR_NAME').DisplayWidth:=8;
  end;
  
  CheckBox1.Checked:=False;
  Dgh1.SetFocus;
  Dgh1.SelectedIndex:=1;
//  FieldLabel.Caption:= Dgh1.DataSource.DataSet.FieldByName('FASSET_CODE').DisplayLabel;
//  FilterFieldName:= 'FASSET_CODE';
  Edit1.SetFocus;
end;

procedure TfrmMultiSelectedItem.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMultiSelectedItem.CheckBox1Click(Sender: TObject);
var
  BM:Pointer;//TBookmark;
begin
  with Dgh1.DataSource.DataSet do
  begin
      bm:=GetBookmark;//书签。
      try
        DisableControls;
        Screen.Cursor := crHourGlass;
        First;
        while not Eof do
        begin
          Edit;
          if (Sender as  TCheckBox).Checked then
            FieldByName('selected').Value:=True
          else
            FieldByName('selected').Value:=False;
          Next;
        end;
        GotoBookmark(BM);  // 重新定位到书签
      finally
        FreeBookmark(bm ); //释放书签。
        EnableControls ;
        Screen.Cursor := crDefault;
      end;   
  end;

end;

procedure TfrmMultiSelectedItem.Dgh1ColEnter(Sender: TObject);
begin
  with  Dgh1.DataSource.DataSet do

  if FieldByName((Sender as TDBGridEh).SelectedField.FieldName).DataType<>ftBoolean then
  begin
    FieldLabel.Caption:=(Sender as TDBGridEh).SelectedField.DisplayLabel;
    FieldLabel.Left:=5;
    Edit1.Left:=10+ FieldLabel.Width;
    bt1.Left:= Edit1.Left+ Edit1.Width+5;
    FilterFieldName:= (Sender as TDBGridEh).SelectedField.FieldName;
  end;
end;

procedure TfrmMultiSelectedItem.Dgh1Enter(Sender: TObject);
begin
  if (Sender as TDBGridEh).SelectedField.DataType<>ftBoolean then
  begin
    FieldLabel.Caption:=(Sender as TDBGridEh).SelectedField.DisplayLabel;
    FieldLabel.Left:=5;
    Edit1.Left:=10+ FieldLabel.Width;
    bt1.Left:= Edit1.Left+ Edit1.Width+5;
    FilterFieldName:= (Sender as TDBGridEh).SelectedField.FieldName;
  end;
end;

procedure TfrmMultiSelectedItem.Edit1Change(Sender: TObject);
var
  strsql: string;
begin
 // if AddListForm.Visible=True then
  begin
    strsql := '';
     if trim(Edit1.Text) <> '' then
        begin
        strsql :=  FilterFieldName+' like ''%' + trim(Edit1.Text) + '%''';
        end   ;
    if strsql <> '' then
    begin
      Dgh1.DataSource.DataSet.Filter := strsql;
      Dgh1.DataSource.DataSet.Filtered := true;
    end
    else
    begin
      Dgh1.DataSource.DataSet.Filter := '';
      Dgh1.DataSource.DataSet.Filtered := false;
    end;
  end;
end;

end.
