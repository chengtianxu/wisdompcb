unit edit_req_date;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DBGridEh, Menus,
  Mask;

type
  Tfrm_edit_req_date = class(TForm)
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    Pn2: TPanel;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_edit_req_date: Tfrm_edit_req_date;

implementation

uses damo,DB,common;

{$R *.dfm}

procedure Tfrm_edit_req_date.FormShow(Sender: TObject);
begin
  
  if (dm.ADO70PO_TYPE.Value = 'S')  then  //读取标准采购
   with dm.ADO71 do
   begin
     
    active:=false;
    sql.Clear;
    sql.Add('SELECT * FROM data0071');
    sql.Add('where po_ptr='+dm.ADO70RKEY.AsString);
    active:=true;
    if dm.ADO71.Filter <> '' then dm.ADO71.Filter := '';
    
    first;
    dm.AQ71.Close;
    dm.AQ71.Parameters[1].Value:=dm.ADO70RKEY.Value;
    dm.AQ71.Open;

   end
  else
  with dm.ADO72 do   //读取杂项采购
   begin
    active:=false;
    sql.Clear;
    sql.Add('SELECT * FROM data0072');
    sql.Add('where poptr='+dm.ADO70RKEY.AsString);
    active:=true;
    if dm.ADO72.Filter <> '' then dm.ADO72.Filter := '';


    first;
    dm.AQ72.Close;
    dm.AQ72.Parameters[1].Value:=dm.ADO70RKEY.Value;
    dm.AQ72.Open;
    dbgrid1.Visible:=false;
    dbgrid2.Visible:=true;

   end;                  //如果货币为基准货
end;

procedure Tfrm_edit_req_date.BitBtn2Click(Sender: TObject);
var
 search_option:tlocateoptions;
begin
  if dbgrid1.Visible=true then
    begin

      dm.ADO71.UpdateBatch();
      search_option := [lopartialkey];
      dm.ADO71.First;
      while not dm.ADO71.Eof do
      begin
        if dm.aq71.Locate('rkey',dm.ADO71RKEY.value,search_option) then
        begin     //看那些字段被修改
//          ShowMessage('1');
          if dm.AQ71REQ_DATE.Value<>dm.ADO71REQ_DATE.Value then
          with dm.ADO0339 do
          begin
//             ShowMessage('a');
            active:=false;
            Parameters.ParamValues['po_ptr'] := dm.ADO70RKEY.Value;
            Parameters.ParamValues['edit_empl_ptr'] := user_ptr;
            Parameters.ParamValues['tran_type'] := 1;
            Parameters.ParamValues['tran_desc'] := '采购项目要求到货日期已改';
            Parameters.ParamValues['tran_from'] := dm.AQ71REQ_DATE.AsString;
            Parameters.ParamValues['tran_to'] := dm.ADO71REQ_DATE.AsString;
            Parameters.ParamValues['data0071_ptr'] := dm.ADO71RKEY.Value;
            Parameters.ParamValues['data0072_ptr'] := null;
            ExecSQL;
          end;
        end;
        dm.ADO71.Next;
      end; //记录修改了那些标准采购条目,同时更新交付排程

    end
  else
  begin

    dm.ADO72.UpdateBatch();
    search_option := [lopartialkey];
    dm.ADO72.First;
    while not dm.ADO72.Eof do
    begin
     if dm.aq72.Locate('rkey',dm.ADO72RKEY.value,search_option) then
      begin     //看那些字段被修改
//        ShowMessage('2');
        if dm.AQ72DEL_DATE.Value <> dm.ADO72DEL_DATE.Value then
        with dm.ADO0339 do
         begin
//           ShowMessage('b');
          active:=false;
          Parameters.ParamValues['po_ptr'] := dm.ADO70RKEY.Value;
          Parameters.ParamValues['edit_empl_ptr'] := user_ptr;
          Parameters.ParamValues['tran_type'] := 1;
          Parameters.ParamValues['tran_desc'] := '杂项采购条目要求到货日期已改';
          Parameters.ParamValues['tran_from'] := dm.AQ72del_DATE.AsString;
          Parameters.ParamValues['tran_to'] := dm.ADO72del_DATE.AsString;
          Parameters.ParamValues['data0071_ptr'] := null;
          Parameters.ParamValues['data0072_ptr'] := dm.ADO72RKEY.Value;
          ExecSQL;
         end;
      end;
      dm.ADO72.Next;
    end;  //记录修改了那些杂项采购条目

  end;
  ModalResult := mrOk;
end;

procedure Tfrm_edit_req_date.N1Click(Sender: TObject);
begin
  if DBGrid1.Visible then
  begin
    MaskEdit1.Text := DM.ADO71REQ_DATE.AsString;
  end
  else
  begin
    MaskEdit1.Text := DM.ADO72DEL_DATE.AsString;
  end;
  Pn2.Visible := True;
end;

procedure Tfrm_edit_req_date.BitBtn1Click(Sender: TObject);
begin
  try
    Pn2.Visible := False;
    if DBGrid1.Visible then
    begin
      DM.ADO71.Edit;
      DM.ADO71REQ_DATE.Value := StrToDateTime(MaskEdit1.Text);
      DM.ADO71.Post;
    end
    else
    begin
      DM.ADO72.Edit;
      DM.ADO72DEL_DATE.Value := StrToDateTime(MaskEdit1.Text);
      DM.ADO72.Post;
    end;

  except
    on E:Exception do
    begin
      ShowMessage('日期格式不正确，请输入正确的格式');
      Exit;
    end;
  end;
end;

procedure Tfrm_edit_req_date.PopupMenu1Popup(Sender: TObject);
begin
  if DBGrid1.Visible then
  begin
    if  DM.ADO71.IsEmpty then
      N1.Enabled := False
    else
      N1.Enabled := True;
  end
  else
  begin
    if  DM.ADO72.IsEmpty then
      N1.Enabled := False
    else
      N1.Enabled := True;
  end;
end;

end.
