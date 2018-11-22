unit EditUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGridEh, Mask, Menus;

type
  TEditForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    N4: TMenuItem;
    N6: TMenuItem;
    Panel2: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Edit2: TEdit;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox2: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
    vkey0039:integer;
    vEditMode:integer;
    function Get_key0039: integer;
    procedure Set_key0039(const Value: integer);
    procedure Set_EditMode(const Value: integer);
  public
    { Public declarations }
     property key0039:integer read Get_key0039 write Set_key0039;
     property EditMode:integer write Set_EditMode;
  end;

var
  EditForm1: TEditForm1;

implementation

uses
   DMUnit1
   ,Pick_Item_Single
   ,ConstVar;
   
{$R *.dfm}

{ TEditForm1 }

function TEditForm1.Get_key0039: integer;
begin
  result := vkey0039;
end;

procedure TEditForm1.Set_EditMode(const Value: integer);
begin
  vEditMode := value;
end;

procedure TEditForm1.Set_key0039(const Value: integer);
begin
  vkey0039 := value;
end;

procedure TEditForm1.BitBtn1Click(Sender: TObject);
begin 
  if trim(MaskEdit1.Text) = '' then
    begin
     showmessage('缺陷代码不能为空!');
     MaskEdit1.SetFocus ;
     exit;
    end;

  if trim(edit2.Text) = '' then
    begin
     showmessage('缺陷名称不能为空!');
     edit2.SetFocus ;
     exit;
    end;

  if RadioGroup1.ItemIndex = -1 then
    begin
     showmessage('没有选择类别!!');
     exit;
    end;

  dm.TemADOQuery1.Close ;
  dm.TemADOQuery1.SQL.Clear ;
  dm.TemADOQuery1.SQL.Add('select rkey from data0039 where REJ_CODE = '+''''+trim(MaskEdit1.Text)+'''');
  if vEditMode = 1 then
    dm.TemADOQuery1.SQL.Add('and rkey <> ' +inttostr(vkey0039));
  dm.TemADOQuery1.Prepared ;
  dm.TemADOQuery1.Open ;
  if not dm.TemADOQuery1.IsEmpty then
    begin
      showmessage('缺陷代码名称已存在不能保存,请重新输入!');
      MaskEdit1.SetFocus ;
      exit;
    end ;
  try
      dm.ADOConnection1.BeginTrans ;
      if vEditMode = 0 then
          begin
            dm.AD39.Append ;
          end
      else if vEditMode = 1 then
          begin
            dm.AD39.edit ;
          end ;

      dm.AD39REJ_CODE.Value := trim(MaskEdit1.Text);
      dm.AD39REJECT_DESCRIPTION.Value := trim(edit2.Text);
      if RadioGroup1.ItemIndex = 0 then
          dm.AD39REJECT_DEFECT_FLAG.Value := 'R'
      else if RadioGroup1.ItemIndex = 1 then
          dm.AD39REJECT_DEFECT_FLAG.Value := 'D';

     dm.AD39rej_type.AsInteger := ComboBox1.ItemIndex;
     dm.AD39FQCBugsCode.Value:=integer(combobox2.items.objects[combobox2.itemindex]);
      dm.AD39.UpdateBatch();
      dm.ad40.First ;
      while not dm.ad40.Eof do
          begin
              if dm.AD40REJECT_CODE_PTR.IsNull then
                  begin
                      dm.ad40.Edit ;
                      dm.AD40REJECT_CODE_PTR.Value := dm.ad39rkey.Value ;
                  end;

              dm.ad40.Next ;
          end;
      dm.ad40.UpdateBatch();

     if (vEditMode = 0) and (dm.seed_flag<>1) then
      begin
      dm.TemADOQuery1.Close ;
      dm.TemADOQuery1.SQL.Clear ;
      dm.TemADOQuery1.SQL.Add('update data0004 set seed_value = '+''''+trim(MaskEdit1.Text)+''''+ ' where rkey = 15');
      dm.TemADOQuery1.ExecSQL ;
      end;

      dm.ADOConnection1.CommitTrans ;
      Modalresult := mrOK;
  except
    on E: Exception do
      begin
        dm.ADOConnection1.RollbackTrans ;
        MessageDlg(E.Message,mtError, [mbOk], 0);
      end;
  end;




end;

procedure TEditForm1.BitBtn2Click(Sender: TObject);
begin
  Modalresult := mrCancel ;
end;

procedure TEditForm1.FormShow(Sender: TObject);
begin
  if dm.AD39.Active then dm.AD39.Close;
  if dm.AD40.Active then dm.AD40.Close;
  if vEditMode = 0 then
      begin
          dm.AD39.Parameters.ParamValues['rkey39'] := null;
          dm.AD40.Parameters.ParamValues['rkey39'] := null;
          MaskEdit1.Text := dm.Get_Data0004 ;
          dm.AD39.Prepared ;
          dm.AD39.Open ;
          dm.AD40.Prepared ;
          dm.AD40.Open ;
      end
  else if vEditMode = 1 then
      begin
          dm.AD39.Parameters.ParamValues['rkey39'] := vkey0039 ;
          dm.AD40.Parameters.ParamValues['rkey39'] := vkey0039 ;
          dm.AD39.Prepared ;
          dm.AD39.Open ;
          dm.AD40.Prepared ;
          dm.AD40.Open ;
          MaskEdit1.Text := dm.AD39REJ_CODE.Value ;
          edit2.Text := dm.AD39REJECT_DESCRIPTION.Value ;
          if dm.AD39REJECT_DEFECT_FLAG.Value = 'R' then
              RadioGroup1.ItemIndex := 0
          else if dm.AD39REJECT_DEFECT_FLAG.Value = 'D' then
              RadioGroup1.ItemIndex := 1;

          ComboBox1.ItemIndex := dm.AD39rej_type.AsInteger ;
      end
  else if vEditMode = 2 then
      begin
          dm.AD39.Parameters.ParamValues['rkey39'] := vkey0039 ;
          dm.AD40.Parameters.ParamValues['rkey39'] := vkey0039 ;
          dm.AD39.Prepared ;
          dm.AD39.Open ;
          dm.AD40.Prepared ;
          dm.AD40.Open ;
          MaskEdit1.Text := dm.AD39REJ_CODE.Value ;
          edit2.Text := dm.AD39REJECT_DESCRIPTION.Value ;
          if dm.AD39REJECT_DEFECT_FLAG.Value = 'R' then
              RadioGroup1.ItemIndex := 0
          else if dm.AD39REJECT_DEFECT_FLAG.Value = 'D' then
              RadioGroup1.ItemIndex := 1;
          ComboBox1.ItemIndex := dm.AD39rej_type.AsInteger ;
          
          MaskEdit1.Enabled := false;
          edit2.Enabled := false;
          n4.Visible := false ;
          n6.Visible := false;
          BitBtn1.Visible := false ;
          RadioGroup1.Enabled := false;
          ComboBox1.Enabled := false;

      end;
//2017029tang添FQC缺陷类别
  DM.TemADOQuery1.Close;
  dm.TemADOQuery1.SQL.Clear;
  dm.TemADOQuery1.SQL.Text:='select * from  dbo.QC_GroupNameOfBug order by FQCBugsCode';
  dm.TemADOQuery1.Open;
  ComboBox2.Items.Clear;
  if not dm.TemADOQuery1.IsEmpty then
  begin
    while not dm.TemADOQuery1.Eof do
    begin
      ComboBox2.Items.AddObject(dm.TemADOQuery1.fieldBYName('FQCBugSName').AsString,Pointer(dm.TemADOQuery1.fieldBYName('FQCBugsCode').AsInteger));
      dm.TemADOQuery1.Next;
    end;
  end;
  if vEditMode = 0 then
    ComboBox2.ItemIndex:=0
  else
    ComboBox2.ItemIndex:=ComboBox2.Items.IndexOf(DM.ADOQALL2FQCBugSName.AsString);

//end 20170209tang
end;

procedure TEditForm1.N6Click(Sender: TObject);
begin
  if dm.AD40.Active then
      if not dm.AD40.IsEmpty then
          dm.AD40.Delete ;
end;

procedure TEditForm1.N4Click(Sender: TObject);
var
  InputVar: PDlgInput ;
  s:string;
  frmPick_Item_Single2 :TfrmPick_Item_Single;
begin
  if dm.AD40.Active then
      begin
          frmPick_Item_Single2 := TfrmPick_Item_Single.Create(application) ;
            try
                s := 'select rkey,dept_code,dept_name from data0034 where ttype = 1 ORDER by dept_code ';
                //frmPick_Item_Single.Height := 600;
                //frmPick_Item_Single.Width := 800;
                InputVar.Fields := 'dept_code/工序代号/300,dept_name/工序名称/300';
                //InputVar.KeyField
                InputVar.Sqlstr := s ;
                //InputVar.InPut_value
                InputVar.AdoConn := DM.ADOConnection1 ;
                frmPick_Item_Single2.InitForm_New(InputVar)  ;
                if frmPick_Item_Single2.ShowModal = mrok then
                    begin
                        if frmPick_Item_Single2.adsPick.IsEmpty then exit;

                        if not dm.AD40.Locate('DEPT_PTR',frmPick_Item_Single2.adsPick.FieldValues['RKEY'],[]) then
                            begin
                                dm.AD40.Append ;
                                if not dm.AD39RKEY.IsNull then
                                    dm.AD40REJECT_CODE_PTR.Value := dm.AD39RKEY.Value ;
                                dm.AD40DEPT_PTR.Value := frmPick_Item_Single2.adsPick.FieldValues['RKEY'];
                            end
                        else
                            showmessage('此工序已加,不能再加!');
                    end;
            finally
                frmPick_Item_Single2.adsPick.Close;
                frmPick_Item_Single2.Free ;
            end;

      end ;
end;

procedure TEditForm1.MaskEdit1Change(Sender: TObject);
begin
   BitBtn1.Enabled := true ;
end;

procedure TEditForm1.Edit2Change(Sender: TObject);
begin
   BitBtn1.Enabled := true ;
end;

end.
