--ǧ�����������

--MisDescBegin
x206008_g_ScriptId = 206008
--x206008_g_MissionIdPre =34
x206008_g_MissionId = 35
x206008_g_MissionKind = 8
x206008_g_MissionLevel = 40
--x206008_g_ScriptIdNext = {ScriptId = 206009 ,LV = 1 }
x206008_g_Name	="������" 
x206008_g_DemandItem ={{id=13010048,num=10}}
x206008_g_noDemandKill ={id=401,num=1}


x206008_g_MissionName="ǧ�����������"
x206008_g_MissionInfo="����Ӧ��Ϊ�ܼ����Ҷ����ң����ǳɼ�˼�����µ�ͨ���ף����˺�����ͨ��֮�⣬��ֻ���ɼ�˼�����ҵĸ�ĸ˵����\n \n    ���ϵ��������θ����ң��ɼ�˼���ǳ�����Ķ��ӣ����縺��ͳһ���µ����Σ����ң��������ܸɣ����������ʦ��ֻ�������ң����ܴ�Ӯ�ɣ�\n \n    ����̫������ܣ��㻹û���ʸ�������������Ҫʮ��#c0080C0ǧ�����������#W����ҩ�����䳤������֮ҩ��\n \n    ѡ���㣬��������ң����ȥΪ�����������ɣ�"  --��������
x206008_g_MissionTarget="    �ɼ�ʮ��#c0080C0ǧ�����������#W����#G������#W��"		                                                                                               
x206008_g_MissionComplete="    ���ҵ�#c0080C0ǧ�����������#W�ˣ���ô���ܡ�������ƾ�㣿��\n \n    ���ҡ������⻬����������֬���������硭�����㣬����ô�����ҵ���ǧ�����һ����ڱ������������ô�ᡭ��\n \n    ��~���ܱ�Ǹ����ʧ̬�ˣ������������Ǹ��������ĸ��ְ����ɼ�˼��һ����������ʣ���Ҫ���Ƽ��Ļ����㽫���Ϊ�������ε��ǿɶ���\n \n    �����ǵģ��Һ���ʮ����Ե�������������������ҵ��Ƽ��ţ�������л�������#G�ɼ�˼��#W��һ����õ����á������������������һ�ж��Ӳ����ҵ��۾����������ʲô��Ҫ�Ļ��ܣ��ǵ�͵͵�����ң�����ɣ���ֻ�����Ϊ�󺹷ֵ����ѣ�"			--�������npc˵���Ļ�
x206008_g_ContinueInfo="    ̫������ܣ��㻹û���ʸ�������й¶�����Ҫ����Ǵ�ģ�"
--������
x206008_g_MoneyBonus = 10000

--�̶���Ʒ���������8��
x206008_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x206008_g_RadioItemBonus={}

--MisDescEnd
x206008_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x206008_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	

	--����г�����
	if x206008_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x206008_g_MissionId) > 0 then
			if x206008_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                	        BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x206008_g_MissionName)
				AddText(sceneId,x206008_g_ContinueInfo)
			        AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x206008_g_MissionTarget) 
				AddText(sceneId,format("\n    ǧ�����������   %d/%d", LuaFnGetItemCount(sceneId,selfId,x206008_g_DemandItem[1].id),x206008_g_DemandItem[1].num ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			end
                	
			     
                	if x206008_CheckSubmit(sceneId, selfId, targetId) > 0 then
                	     BeginEvent(sceneId)
                	     AddText(sceneId,"#Y"..x206008_g_MissionName)
			     AddText(sceneId,x206008_g_MissionComplete)
			     AddMoneyBonus(sceneId, x206008_g_MoneyBonus)
                	     EndEvent()
			     DispatchMissionContinueInfo(sceneId, selfId, targetId, x206008_g_ScriptId, x206008_g_MissionId)
                	end
      
        elseif x206008_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x206008_g_MissionName)
                AddText(sceneId,x206008_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x206008_g_MissionTarget) 
		AddMoneyBonus(sceneId, x206008_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x206008_g_ScriptId, x206008_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x206008_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x206008_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x206008_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x206008_g_ScriptId, x206008_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x206008_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x206008_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x206008_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==6) then
                    return 1
        end
	return 0
	
end

--**********************************

--����

--**********************************

function x206008_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x206008_g_MissionId, x206008_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x206008_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x206008_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x206008_g_MissionId)
	for i, item in x206008_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x206008_CheckSubmit( sceneId, selfId, targetId)
	if LuaFnGetItemCount(sceneId,selfId,x206008_g_DemandItem[1].id) == x206008_g_DemandItem[1].num then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x206008_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x206008_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x206008_g_MissionId)
		AddExp(sceneId, selfId, x206008_g_ExpBonus)
		AddMoney(sceneId, selfId, x206008_g_MoneyBonus)
		for i, item in x206008_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x206008_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x206008_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x206008_OnKillObject(sceneId, selfId, objdataId)
	if LuaFnGetItemCount(sceneId,selfId,x206008_g_DemandItem[1].id) < x206008_g_DemandItem[1].num then
        	if IsHaveMission(sceneId,selfId, x206008_g_MissionId) > 0 then
        		if objdataId == x206008_g_noDemandKill.id then
				BeginAddItem(sceneId)                                                    
				AddItem( sceneId,x206008_g_DemandItem[1].id, 1 )             
				ret = EndAddItem(sceneId,selfId)                                 
		        	if ret > 0 then                                                  
		       	 	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("ǧ�����������   %d/%d", LuaFnGetItemCount(sceneId,selfId,x206008_g_DemandItem[1].id)+1,x206008_g_DemandItem[1].num )) 
				 	EndEvent()
				 	DispatchMissionTips(sceneId, selfId)
				 	AddItemListToHuman(sceneId,selfId) 
		        	else                                                             
		        	 	BeginEvent(sceneId)                                      
				 	AddText(sceneId,"��Ʒ��������")                    
				 	EndEvent(sceneId)                                        
				 	DispatchMissionTips(sceneId,selfId) 
				end
			end
		end
	end
	 

end



--**********************************

--���������¼�

--**********************************

function x206008_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x206008_OnItemChanged(sceneId, selfId, itemdataId)

end

