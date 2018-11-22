unit Mdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons;

type
  Tfm_madd = class(TForm)
    bbt_exit: TBitBtn;
    bbt_save: TBitBtn;
    dbedt_code: TDBEdit;
    dbedt_name: TDBEdit;
    lb_code: TLabel;
    lb_name: TLabel;
    dbt_hide: TDBEdit;
    lb_tra: TLabel;
    dbt_tra: TDBEdit;
    Label1: TLabel;
    dbt_over: TDBEdit;
    Label2: TLabel;
    DBCheckBox1: TDBCheckBox;
    procedure bbt_exitClick(Sender: TObject);
    procedure bbt_saveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    newdepname : string;
    { Public declarations }
  end;

var
  fm_madd: Tfm_madd;

implementation

uses UDM,common;

{$R *.dfm}

procedure Tfm_madd.bbt_exitClick(Sender: TObject);
begin
  DM.qry_dept.Cancel;
  ModalResult:=mrCancel;
end;

procedure Tfm_madd.bbt_saveClick(Sender: TObject);
begin
  if (dbedt_code.Text='') or (dbedt_name.Text='') then
    begin
      ShowMessage('部门代码或者部门名称不能为空');
      Exit;
    end;
  newdepname := Trim(dbedt_name.Text);
  DM.qry_dept.Post;
  ModalResult:=mrOk;
end;

procedure Tfm_madd.FormCreate(Sender: TObject);
begin
   dbt_tra.Enabled:=false;
   dbt_over.Enabled := false;
   if  strtoint(vprev)=4 then dbt_tra.Enabled :=true;
   if  strtoint(vprev)=4 then dbt_over.Enabled :=true;
end;

end.
